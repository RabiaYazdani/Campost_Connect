import 'package:campostconnect/Accounts_screen/accounts_screen.dart';
import 'package:campostconnect/Home_Tab/Home_Screen/HomeScreen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Constant_Widgets/constParameters.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

String countryCode = "";
String mobileNo = "";
String pinCode = "";
bool _stringOne = false;
bool _stringTwo = false;
bool _stringThree = false;
bool _stringFour = false;
bool _stringFive = false;

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Container(
              height: mediaQuery.height * 0.4,
              width: mediaQuery.width,
              child: Image.asset(
                'assets/images/login_Image.png',
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Center(
                child: Text(
              'Hello There, log in to continue',
              style: Theme.of(context).textTheme.headline2,
            )),
            Padding(
                padding: EdgeInsets.only(
                    left: mediaQuery.width * 0.07,
                    top: mediaQuery.height * 0.02,
                    right: mediaQuery.width * 0.07),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile Number',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 246, 227, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            CountryCodePicker(
                              enabled: true,
                              onInit: (c) {
                                c!.code;
                                countryCode = c.dialCode!;
                              },
                              onChanged: (c) {
                                setState(() {
                                  c.name;
                                  countryCode = c.dialCode!;
                                });
                              },
                              initialSelection: 'PK',
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              favorite: const ['+92', 'PK'],
                              flagDecoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                            ),
                            Expanded(
                              child: TextField(
                                onSubmitted: (number) {
                                  mobileNo = number;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'Mobile Number'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Text(
                        'Pin Code',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ConstantParameters.ContainerWidget(
                            context,
                            _stringOne,
                            TextField(
                              onTap: () {
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
                              onTap: () {
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
                              onTap: () {
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
                              onTap: () {
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
                              onTap: () {
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
                          padding: EdgeInsets.only(
                            top: mediaQuery.height * 0.01,
                            left: mediaQuery.height * 0.02,
                            right: mediaQuery.height * 0.02,
                          ),
                          height: mediaQuery.height * 0.1,
                          width: mediaQuery.width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountsScreen()));
                            },
                            child: Text(
                              'Log In',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Align(
                          child: Text(
                        'Or',
                        style: TextStyle(fontSize: 25, color: Colors.black12),
                      )),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => HomeScreen()));
                            },
                            icon: Icon(
                              Icons.account_box_outlined,
                              color: Colors.amberAccent,
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Log In with face screen',
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ])),
          ]))),
    );
  }
}
