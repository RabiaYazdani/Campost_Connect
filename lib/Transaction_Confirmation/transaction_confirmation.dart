import 'package:campostconnect/Home_Tab/Home_Screen/HomeScreen.dart';
import 'package:campostconnect/Home_Tab/tab_screen.dart';
import 'package:campostconnect/Mobile_Verification/header_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constant_Widgets/constParameters.dart';

class TransactionConfirmationScreen extends StatefulWidget {
  const TransactionConfirmationScreen({Key? key}) : super(key: key);

  @override
  _TransactionConfirmationScreenState createState() =>
      _TransactionConfirmationScreenState();
}

String pinCode = "";
bool _stringOne = false;
bool _stringTwo = false;
bool _stringThree = false;
bool _stringFour = false;
bool _stringFive = false;

class _TransactionConfirmationScreenState
    extends State<TransactionConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
        height: mediaQuery.height * 0.7,
        color: Color(0xFF696968),
        child: Container(
          padding: EdgeInsets.only(
            top: mediaQuery.height * 0.04,
            right: mediaQuery.width * 0.05,
            left: mediaQuery.width * 0.05,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.cancel,
                    size: 30,
                    color: Colors.red[200],
                  ),
                ),
              ),
              HeaderWidgets(
                  mediaQuery: mediaQuery,
                  heading: 'Confirm Your Pin Code',
                  subtext:
                      'Once you confirm your transaction will be complete'),
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration.collapsed(hintText: "-"),
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration.collapsed(hintText: "-"),
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration.collapsed(hintText: "-"),
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration.collapsed(hintText: "-"),
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration.collapsed(hintText: "-"),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => TabScreen()));
                    },
                    child: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ))
            ],
          ),
        ));
  }
}
