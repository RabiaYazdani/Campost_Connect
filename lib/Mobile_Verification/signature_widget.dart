import 'package:campostconnect/Login_Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureWidget extends StatefulWidget {
  const SignatureWidget({Key? key}) : super(key: key);

  @override
  State<SignatureWidget> createState() => _SignatureWidgetState();
}

class _SignatureWidgetState extends State<SignatureWidget> {
  late SignatureController controller;
  @override
  void initState() {
    super.initState();
    controller =
        SignatureController(penColor: Colors.redAccent, penStrokeWidth: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Signature',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: mediaQuery.width * 0.2,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.cancel,
                        size: 30,
                        color: Colors.red[200],
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQuery.width * 0.01,
                ),
                Text(
                  'Please sign in the area and confirm to account terms and conditions',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: mediaQuery.width * 0.01),
                Card(
                    elevation: 4,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Signature(
                      controller: controller,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      height: 250,
                      width: 300,
                    )),
                SizedBox(height: mediaQuery.width * 0.03),
                Container(
                    padding: EdgeInsets.only(
                        top: mediaQuery.height * 0.01,
                        right: mediaQuery.width * 0.01),
                    height: mediaQuery.height * 0.1,
                    width: mediaQuery.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.isNotEmpty) {
                          final export = SignatureController(
                              penStrokeWidth: 2,
                              penColor: Color.fromRGBO(253, 217, 32, 1),
                              exportBackgroundColor: Colors.white,
                              points: controller.points);
                          //TODO: this is the signature image which can be stored in the databse
                          final signature = await export.toImage();
                          print(signature.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInScreen()));
                        } else
                          return;
                      },
                      child: Text(
                        'Submit Signature',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )),
                SizedBox(height: mediaQuery.height * 0.01),
              ],
            ),
          ),
        ));
  }
}
