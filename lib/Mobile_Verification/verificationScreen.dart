import 'dart:async';
import 'package:campostconnect/Mobile_Verification/header_widgets.dart';
import 'package:campostconnect/Mobile_Verification/pinCode_Screen.dart';
import 'package:campostconnect/Constant_Widgets/back_ground_image_widget.dart';
import 'package:campostconnect/Constant_Widgets/back_to_previous_screen.dart';
import 'package:campostconnect/Constant_Widgets/constParameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key, required this.mobileNumber})
      : super(key: key);
  final String mobileNumber;
  static const String route = 'verification_screen';

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

String verificationCode = "";
bool _stringOne = false;
bool _stringTwo = false;
bool _stringThree = false;
bool _stringFour = false;
bool _stringFive = false;

class _VerificationScreenState extends State<VerificationScreen> {
  static const maxSecond = 60;
  int second = maxSecond;
  Timer? timer;
  void StartTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (second > 0) {
        setState(() {
          second--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StartTimer();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          BackGroundImage(
              mediaQuery: mediaQuery,
              imagePath: 'assets/images/veri_background.png'),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackToPreviousScreen(),
                Padding(
                  padding: EdgeInsets.only(left: mediaQuery.width * 0.09),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderWidgets(
                          mediaQuery: mediaQuery,
                          heading: 'Verification',
                          subtext: 'Enter Five Digit Code we Sent to ' +
                              widget.mobileNumber),
                      SizedBox(height: mediaQuery.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ConstantParameters.ContainerWidget(
                            context,
                            _stringOne,
                            TextField(
                              onChanged: (_) {
                                setState(() {
                                  _stringOne = !_stringOne;
                                });
                              },
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration.collapsed(hintText: "-"),
                              onSubmitted: (code) {
                                pinCode = pinCode + code;
                              },
                            ),
                          ),
                          ConstantParameters.ContainerWidget(
                            context,
                            _stringTwo,
                            TextField(
                              onChanged: (_) {
                                setState(() {
                                  _stringTwo = !_stringTwo;
                                });
                              },
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration.collapsed(hintText: "-"),
                              onSubmitted: (code) {
                                pinCode = pinCode + code;
                              },
                            ),
                          ),
                          ConstantParameters.ContainerWidget(
                            context,
                            _stringThree,
                            TextField(
                              onChanged: (_) {
                                setState(() {
                                  _stringThree = !_stringThree;
                                });
                              },
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration.collapsed(hintText: "-"),
                              onSubmitted: (code) {
                                pinCode = pinCode + code;
                              },
                            ),
                          ),
                          ConstantParameters.ContainerWidget(
                            context,
                            _stringFour,
                            TextField(
                              onChanged: (_) {
                                setState(() {
                                  _stringFour = !_stringFour;
                                });
                              },
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration.collapsed(hintText: "-"),
                              onSubmitted: (code) {
                                pinCode = pinCode + code;
                              },
                            ),
                          ),
                          ConstantParameters.ContainerWidget(
                            context,
                            _stringFive,
                            TextField(
                              onChanged: (_) {
                                setState(() {
                                  _stringFive = !_stringFive;
                                });
                              },
                              textInputAction: TextInputAction.send,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration.collapsed(hintText: "-"),
                              onSubmitted: (code) {
                                pinCode = pinCode + code;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      GestureDetector(
                        //TODO: RESEND CODE WILL BE ADDED HERE !
                        onTap: () {
                          if (second > 0) return;
                        },
                        child: Text(
                          second > 0
                              ? "Resend Code in 00:${second}"
                              : 'Resend Code Now',
                          style: TextStyle(
                            color: Color.fromRGBO(253, 217, 32, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(right: mediaQuery.width * 0.05),
                          padding: EdgeInsets.only(
                              top: mediaQuery.height * 0.01,
                              right: mediaQuery.width * 0.01),
                          height: mediaQuery.height * 0.1,
                          width: mediaQuery.width,
                          child: ElevatedButton(
                            onPressed: () {
                              print(verificationCode);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PinCodeScreen()));
                            },
                            child: Text(
                              'Send Code',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
