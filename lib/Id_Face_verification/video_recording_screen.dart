import 'dart:async';
import 'package:campostconnect/Constant_Widgets/constParameters.dart';
import 'package:campostconnect/Personal_Data_Screen/personal_data_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late CameraController _controller;
  double seconds = 5;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(
      ConstantParameters.camera[1],
      ResolutionPreset.high,
      enableAudio: false,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return CameraPreview(_controller);
                  } else {
                    // Otherwise, display a loading indicator.
                    return const Center(child: CircularProgressIndicator());
                  }
                },
                future: _initializeControllerFuture,
              ),
            ),
            ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                    BlendMode.srcOut), // This one will create the magic
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          backgroundBlendMode: BlendMode
                              .dstOut), // This one will handle background + difference out
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ClipOval(
                        child: Container(
                          height: mediaQuery.height * 0.56,
                          width: mediaQuery.width * 0.67,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.blue, width: 3),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(bottom: mediaQuery.height * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.08,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _initializeControllerFuture;

                      final video = _controller.startVideoRecording();
                      if (kDebugMode) {
                        print(video);
                      }
                      if (seconds > 0) {
                        _updateProgress();
                      }
                      if (seconds <= 0) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const PersonalDataScreen()));
                      }
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.amberAccent,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: Text(
                            "0" + seconds.toStringAsPrecision(1),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          _controller.stopVideoRecording();

          t.cancel();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const PersonalDataScreen()));
        }
      });
    });
  }
}
