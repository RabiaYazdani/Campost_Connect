import 'dart:io';
import 'package:camera/camera.dart';
import 'package:campostconnect/Constant_Widgets/constParameters.dart';
import 'package:campostconnect/Id_Face_verification/video_recording_screen.dart';
import 'package:campostconnect/Constant_Widgets/back_to_previous_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IdCardVerification extends StatefulWidget {
  const IdCardVerification({Key? key}) : super(key: key);

  @override
  IdCardVerificationState createState() => IdCardVerificationState();
}

class IdCardVerificationState extends State<IdCardVerification> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      ConstantParameters.camera.first,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        // You must wait until the controller is initialized before displaying the
        // camera preview. Use a FutureBuilder to display a loading spinner until the
        // controller has finished initializing.
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return CameraPreview(_controller);
                  } else {
                    // Otherwise, display a loading indicator.
                    return const Center(child: CircularProgressIndicator());
                  }
                },
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
                    Padding(
                      padding: EdgeInsets.only(
                          left: mediaQuery.width * 0.04,
                          right: mediaQuery.width * 0.04),
                      child: Center(
                        child: Container(
                          height: mediaQuery.height * 0.3,
                          width: mediaQuery.width,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(''),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: mediaQuery.width * 0.03,
                  right: mediaQuery.width * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackToPreviousScreen(),
                  SizedBox(
                    height: mediaQuery.width * 0.1,
                  ),
                  const Text(
                    'Place your Id on the flat surface,than take a clear photo from above',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Recto',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Verso',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        )),
                  ]),
                  SizedBox(
                    height: mediaQuery.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 35,
                          child: TextButton(
                            onPressed: () async {
                              // Take the Picture in a try / catch block. If anything goes wrong,
                              // catch the error.
                              try {
                                // Ensure that the camera is initialized.
                                await _initializeControllerFuture;

                                // Attempt to take a picture and get the file `image`
                                // where it was saved.
                                final image = await _controller.takePicture();
                                Image.file(File(image.path));
                                // If the picture was taken, display it on a new screen.

                              } catch (e) {
                                // If an error occurs, log the error to the console.
                                if (kDebugMode) {
                                  print(e);
                                }
                              }
                            },
                            child: const Text(''),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.25,
                      ),
                      CircleAvatar(
                          backgroundColor: const Color.fromRGBO(131, 176, 0, 1),
                          radius: 20,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => VideoScreen(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
