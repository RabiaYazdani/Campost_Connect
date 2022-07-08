import 'package:campostconnect/Home_Tab/Home_Screen/HomeScreen.dart';
import 'package:campostconnect/Home_Tab/tab_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../Constant_Widgets/header_widget_2.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

bool _name = false;
bool _fName = false;
bool _country = false;
bool _gender = false;
bool _dob = false;
bool _pinCode = false;
bool _phoneNumber = false;
bool _Verification = false;
String name = 'Adam';
String fName = 'GilChrist';
String gender = 'Male';
String dob = "01/01/1994";
String pinCode = ".....";
String phoneNumber = ("+92 304 5633473");
bool _nameEdit = false;
bool _fNameEdit = false;
bool _pinCodeEdit = false;
bool _phoneNumberEdit = false;

List<String> genderOptions = ['Male', 'Female'];
String initialValue = 'Male';

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/veri_background.png')),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        headerWidget2(
                            mediaQuery: mediaQuery, label: 'Settings'),
                        SizedBox(height: mediaQuery.height * 0.01),
                        _titleWidgets('First Name', 'Last Name', mediaQuery),
                        SizedBox(height: mediaQuery.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SmallContainer(
                                context,
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        if (!_nameEdit)
                                          Text(name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2),
                                        if (_nameEdit)
                                          Container(
                                            height: mediaQuery.height * 0.1,
                                            width: mediaQuery.width * 0.06,
                                            padding: EdgeInsets.only(
                                                top: mediaQuery.height * 0.02),
                                            child: TextField(
                                              autofocus: true,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                      hintText: ""),
                                              cursorColor: Theme.of(context)
                                                  .primaryColor,
                                              onSubmitted: (updatedName) {
                                                setState(() {
                                                  name = updatedName;
                                                  _nameEdit = !_nameEdit;
                                                });
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _name = !_name;
                                          _nameEdit = !_nameEdit;
                                        });
                                      },
                                      child: ImageIcon(
                                        AssetImage(
                                          'assets/images/Edit.png',
                                        ),
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                _name),
                            SmallContainer(
                                context,
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        if (!_nameEdit)
                                          Text(fName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2),
                                        if (_fNameEdit)
                                          Container(
                                            height: mediaQuery.height * 0.1,
                                            width: mediaQuery.width * 0.6,
                                            padding: EdgeInsets.only(
                                                top: mediaQuery.height * 0.02),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                      hintText: ""),
                                              cursorColor: Theme.of(context)
                                                  .primaryColor,
                                              onSubmitted: (updatedName) {
                                                setState(() {
                                                  fName = updatedName;
                                                  _fNameEdit = !_fNameEdit;
                                                });
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _fName = !_fName;
                                          _fNameEdit = !_fNameEdit;
                                        });
                                      },
                                      child: ImageIcon(
                                        AssetImage(
                                          'assets/images/Edit.png',
                                        ),
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                _fName),
                          ],
                        ),
                        SizedBox(height: mediaQuery.height * 0.01),
                        _title('Country', mediaQuery),
                        SizedBox(height: mediaQuery.height * 0.01),
                        LargeContainer(
                          context,
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _country = !_country;
                              });
                            },
                            child: Row(
                              children: [
                                CountryCodePicker(
                                  onChanged: (c) {
                                    c.name;
                                  },
                                  showFlag: true,
                                  showCountryOnly: false,
                                  showOnlyCountryWhenClosed: true,
                                  flagDecoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  onInit: (C) => C?.name,
                                  textStyle:
                                      Theme.of(context).textTheme.headline2,
                                  dialogTextStyle:
                                      Theme.of(context).textTheme.headline2,
                                ),
                                Spacer(),
                                ImageIcon(
                                  AssetImage(
                                    'assets/images/Edit.png',
                                  ),
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                          _country,
                        ),
                        SizedBox(height: mediaQuery.height * 0.01),
                        _titleWidgets(
                            'Sex              ', 'Date Of Birth', mediaQuery),
                        SizedBox(height: mediaQuery.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SmallContainer(
                                context,
                                Center(
                                  child: DropdownButton<String>(
                                    alignment: Alignment.center,
                                    underline: Text(''),
                                    hint: Text('Gender'),
                                    value: initialValue,
                                    items: genderOptions.map((genderValue) {
                                      return DropdownMenuItem<String>(
                                        child: Text(
                                          genderValue,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        value: genderValue,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        initialValue = value!;
                                        _gender = !_gender;
                                      });
                                    },
                                    icon: ImageIcon(
                                      AssetImage(
                                        'assets/images/Edit.png',
                                      ),
                                      size: 40,
                                    ),
                                  ),
                                ),
                                _gender),
                            SmallContainer(
                                context,
                                Row(
                                  children: [
                                    Text(
                                      dob,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        final DateTime dateTime =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1912, 1),
                                                lastDate:
                                                    DateTime(2101)) as DateTime;
                                        setState(() {
                                          String formattedDate =
                                              DateFormat('DD/MM/yyyy')
                                                  .format(dateTime);
                                          dob = formattedDate;
                                        });
                                      },
                                      child: ImageIcon(
                                        AssetImage(
                                          'assets/images/Edit.png',
                                        ),
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                _dob),
                          ],
                        ),
                        SizedBox(height: mediaQuery.height * 0.01),
                        _title('Pin Code', mediaQuery),
                        SizedBox(height: mediaQuery.height * 0.01),
                        LargeContainer(
                            context,
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    if (!_pinCodeEdit)
                                      Text(pinCode,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    if (_pinCodeEdit)
                                      Container(
                                        height: mediaQuery.height * 0.1,
                                        width: mediaQuery.width * 0.2,
                                        padding: EdgeInsets.only(
                                            top: mediaQuery.height * 0.02),
                                        child: TextField(
                                          obscureText: true,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(5),
                                          ],
                                          autofocus: true,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          cursorColor:
                                              Theme.of(context).primaryColor,
                                          onSubmitted: (updatedName) {
                                            setState(() {
                                              pinCode = updatedName;
                                              _pinCodeEdit = !_pinCodeEdit;
                                            });
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _pinCodeEdit = !_pinCodeEdit;
                                      _pinCode = !_pinCode;
                                    });
                                  },
                                  child: ImageIcon(
                                    AssetImage(
                                      'assets/images/Edit.png',
                                    ),
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            _pinCode),
                        SizedBox(height: mediaQuery.height * 0.01),
                        _title('Phone Number', mediaQuery),
                        SizedBox(height: mediaQuery.height * 0.01),
                        LargeContainer(
                            context,
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    if (!_phoneNumberEdit)
                                      Text(phoneNumber,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    if (_phoneNumberEdit)
                                      Container(
                                        height: mediaQuery.height * 0.1,
                                        width: mediaQuery.width * 0.2,
                                        padding: EdgeInsets.only(
                                            top: mediaQuery.height * 0.02),
                                        child: TextField(
                                          autofocus: true,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          cursorColor:
                                              Theme.of(context).primaryColor,
                                          onSubmitted: (updatedName) {
                                            setState(() {
                                              phoneNumber = updatedName;
                                              _phoneNumberEdit =
                                                  !_phoneNumberEdit;
                                            });
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _phoneNumber = !_phoneNumber;
                                      _phoneNumberEdit = !_phoneNumberEdit;
                                    });
                                  },
                                  child: ImageIcon(
                                    AssetImage(
                                      'assets/images/Edit.png',
                                    ),
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            _phoneNumber),
                        SizedBox(height: mediaQuery.height * 0.01),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: mediaQuery.width * 0.03,
                              right: mediaQuery.width * 0.03,
                              top: mediaQuery.height * 0.03,
                              bottom: mediaQuery.height * 0.01,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _Verification = !_Verification;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        _Verification
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down_sharp,
                                        size: 40,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(width: 10),
                                      Text('Account Verification',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    ],
                                  ),
                                ),
                                Divider(thickness: 3),
                                if (_Verification)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: mediaQuery.width * 0.03,
                                        right: mediaQuery.width * 0.03),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Please Upload your National ID >'),
                                        SizedBox(
                                            height: mediaQuery.height * 0.02),
                                        Row(
                                          children: [
                                            Text(
                                              'Foreign Passport',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Submitted',
                                              style: TextStyle(
                                                  color: Colors.amberAccent),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: mediaQuery.height * 0.01),
                        Container(
                            height: mediaQuery.height * 0.1,
                            width: mediaQuery.width,
                            padding: EdgeInsets.only(
                              top: mediaQuery.height * 0.01,
                              left: mediaQuery.height * 0.02,
                              right: mediaQuery.height * 0.02,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => TabScreen()));
                              },
                              child: Text(
                                'Save',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ))
                      ]))))),
    );
  }

  Widget SmallContainer(BuildContext context, Widget Child, bool choice) {
    return Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
        ),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: choice ? Theme.of(context).primaryColor : Colors.black12,
              width: 2),
        ),
        child: Child);
  }

  Widget LargeContainer(BuildContext context, Widget Child, bool choice) {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.height * 0.01),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.03,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: choice ? Theme.of(context).primaryColor : Colors.black12,
              width: 2),
        ),
        child: Child);
  }

  _titleWidgets(String one, String two, mediaQuery) {
    return Padding(
      padding: EdgeInsets.only(left: mediaQuery.width * 0.04),
      child: Row(children: [
        Text(
          one,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(width: mediaQuery.width * 0.2),
        Text(
          two,
          style: Theme.of(context).textTheme.headline2,
        )
      ]),
    );
  }

  _title(String label, mediaQuery) {
    return Padding(
        padding: EdgeInsets.only(left: mediaQuery.width * 0.04),
        child: Text(
          label,
          style: Theme.of(context).textTheme.headline2,
        ));
  }
}
