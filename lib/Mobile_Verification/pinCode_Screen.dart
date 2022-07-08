import 'package:campostconnect/Mobile_Verification/signature_widget.dart';
import 'package:campostconnect/Constant_Widgets/back_ground_image_widget.dart';
import 'package:campostconnect/Constant_Widgets/back_to_previous_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constant_Widgets/constParameters.dart';
import 'header_widgets.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

bool _stringOne = false;
bool _stringTwo = false;
bool _stringThree = false;
bool _stringFour = false;
bool _stringFive = false;
String pinCode = "";

class _PinCodeScreenState extends State<PinCodeScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          BackGroundImage(
              mediaQuery: mediaQuery,
              imagePath: 'assets/images/veri_background2.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackToPreviousScreen(),
              Padding(
                padding: EdgeInsets.only(left: mediaQuery.width * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWidgets(
                        mediaQuery: mediaQuery,
                        heading: 'Add Pin Code',
                        subtext: 'Secure your login with pin code'),
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
                    Container(
                        margin: EdgeInsets.only(right: mediaQuery.width * 0.05),
                        padding: EdgeInsets.only(
                            top: mediaQuery.height * 0.01,
                            right: mediaQuery.width * 0.01),
                        height: mediaQuery.height * 0.1,
                        width: mediaQuery.width,
                        child: ElevatedButton(
                          onPressed: () {
                            print(pinCode);
                            showModalBottomSheet(
                                isDismissible: true,
                                isScrollControlled: true,
                                context: context,
                                builder: (ctx) => SignatureWidget());
                          },
                          child: Text(
                            'Add Pin',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
