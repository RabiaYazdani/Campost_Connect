import 'package:camera/camera.dart';
import 'package:campostconnect/Id_Face_verification/Id_Verification.dart';
import 'package:campostconnect/Constant_Widgets/back_to_previous_screen.dart';

import 'package:flutter/material.dart';

class IDScreen extends StatefulWidget {
  const IDScreen({Key? key}) : super(key: key);
  static const String route = "idScreen";

  @override
  State<IDScreen> createState() => _IDScreenState();
}

bool _isNational = false;
bool _isForeign = false;
bool _isPassport = false;

class _IDScreenState extends State<IDScreen> {
  late List<CameraDescription> cameras;
  Future<void> cameraList() async {
    cameras = await availableCameras();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.6,
                    width: mediaQuery.width,
                    child: Image.asset(
                      'assets/images/image.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  BackToPreviousScreen(),
                ],
              ),
              SizedBox(
                height: mediaQuery.height * 0.2,
              ),
              Container(
                  height: mediaQuery.height * 0.12,
                  width: mediaQuery.width,
                  padding: EdgeInsets.only(
                      left: mediaQuery.width * 0.04,
                      right: mediaQuery.width * 0.04,
                      bottom: mediaQuery.height * 0.03),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isPassport == true ||
                          _isForeign == true ||
                          _isNational == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IdCardVerification()));
                      } else {
                        _scaffoldKey.currentState?.showBottomSheet(
                            (context) => const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Please Choose One Option',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                            elevation: 10,
                            backgroundColor:
                                const Color.fromRGBO(240, 214, 49, 1));
                        return;
                      }
                    },
                    child: Text(
                      "Let's Start",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ))
            ]),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: Colors.black,
                elevation: 10,
                child: SizedBox(
                  height: mediaQuery.height * 0.41,
                  width: mediaQuery.width * 0.9,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: mediaQuery.height * 0.05,
                          left: mediaQuery.width * 0.05,
                          right: mediaQuery.width * 0.05,
                        ),
                        child: Text('Please Select to Scan Your ID from here.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isNational = !_isNational;
                            _isPassport = false;
                            _isForeign = false;
                          });
                        },
                        child: userChoice(_isNational, "National ID Card",
                            context, mediaQuery),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isNational = false;
                            _isPassport = !_isPassport;
                            _isForeign = false;
                          });
                        },
                        child: userChoice(_isPassport, "National Passport",
                            context, mediaQuery),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isNational = false;
                            _isPassport = false;
                            _isForeign = !_isForeign;
                          });
                        },
                        child: userChoice(_isForeign, "Foreign Passport",
                            context, mediaQuery),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Padding userChoice(
      bool _isSelected, String option, BuildContext context, mediaQuery) {
    return Padding(
        padding: EdgeInsets.only(
            left: mediaQuery.width * 0.06,
            top: mediaQuery.height * 0.02,
            bottom: mediaQuery.width * 0.02),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor:
                  _isSelected ? Theme.of(context).primaryColor : Colors.black12,
              child: Icon(
                Icons.check,
                color: _isSelected ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Text(
              option,
              style: TextStyle(
                color:
                    _isSelected ? Theme.of(context).primaryColor : Colors.black,
                fontSize: 20,
              ),
            )
          ],
        ));
  }
}
