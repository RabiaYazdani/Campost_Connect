import 'package:campostconnect/Mobile_Verification/mobileNoScreen.dart';
import 'package:campostconnect/Constant_Widgets/back_ground_image_widget.dart';
import 'package:campostconnect/Constant_Widgets/back_to_previous_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);
  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

List<String> gender = ['Male', 'Female'];
String initialValue = 'Male';
String _dateTime = "";
String countryOfResidence = '';
bool _name = false;
bool _fName = false;
bool _country = false;
bool _gender = false;
bool _dob = false;
bool _postalCode = false;
bool _address = false;
bool _areaOfResidence = false;

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // background image
            BackGroundImage(
                mediaQuery: mediaQuery,
                imagePath: 'assets/images/veri_background.png'),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: mediaQuery.width * 0.01,
                    bottom: mediaQuery.height * 0.01,
                    right: mediaQuery.width * 0.01),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Return to back Screen Button ---- Constant
                      BackToPreviousScreen(),
                      // TEXT FIELDS WIDGETS
                      Padding(
                          padding:
                              EdgeInsets.only(top: mediaQuery.height * 0.03),
                          child: Column(children: [
                            // FIRST NAME LAST NAME WIDGET
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SmallContainer(
                                    context,
                                    TextField(
                                      onTap: () {
                                        setState(() {
                                          _name = !_name;
                                        });
                                      },
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration.collapsed(
                                          hintText: "First Name"),
                                      onSubmitted: (code) {},
                                    ),
                                    _name),
                                SmallContainer(
                                    context,
                                    TextField(
                                      textAlign: TextAlign.center,
                                      onTap: () {
                                        setState(() {
                                          _fName = !_fName;
                                        });
                                      },
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Last Name"),
                                      onSubmitted: (code) {},
                                    ),
                                    _fName)
                              ],
                            ),
                            SizedBox(height: mediaQuery.height * 0.01),
                            // LOCATION WIDGET
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
                                          _country = true;
                                        },
                                        showFlag: true,
                                        showCountryOnly: false,
                                        showOnlyCountryWhenClosed: true,
                                        flagDecoration: BoxDecoration(
                                            shape: BoxShape.circle),
                                        onInit: (C) => C?.name,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                        dialogTextStyle: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 40,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(width: mediaQuery.width * 0.02),
                                    ],
                                  ),
                                ),
                                _country),
                            SizedBox(height: mediaQuery.height * 0.01),
                            // GENDER AND DOB
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SmallContainer(
                                    context,
                                    DropdownButton<String>(
                                      underline: Text(''),
                                      hint: Text('Gender'),
                                      value: initialValue,
                                      items: gender.map((genderValue) {
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
                                    ),
                                    _gender),
                                SmallContainer(
                                    context,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          _dateTime.isEmpty
                                              ? 'Birth Date'
                                              : _dateTime,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            final DateTime dateTime =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate:
                                                        DateTime(1912, 1),
                                                    lastDate: DateTime(
                                                        2101)) as DateTime;
                                            if (dateTime != DateTime.now())
                                              setState(() {
                                                _dob = !_dob;
                                                String formattedDate =
                                                    DateFormat('DD/MM/yy')
                                                        .format(dateTime);
                                                _dateTime = formattedDate;
                                              });
                                          },
                                          child: Icon(
                                            Icons.calendar_today,
                                            size: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    _dob),
                              ],
                            ),
                            SizedBox(height: mediaQuery.height * 0.01),
                            // ADDRESS
                            LargeContainer(
                                context,
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: mediaQuery.width * 0.03,
                                    top: mediaQuery.height * 0.03,
                                  ),
                                  child: TextField(
                                    onTap: () {
                                      setState(() {
                                        _address = !_address;
                                      });
                                    },
                                    textAlign: TextAlign.start,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Address Line"),
                                    onSubmitted: (code) {},
                                  ),
                                ),
                                _address),
                            SizedBox(height: mediaQuery.height * 0.01),
                            LargeContainer(
                                context,
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: mediaQuery.width * 0.03,
                                    top: mediaQuery.height * 0.03,
                                  ),
                                  child: TextField(
                                    onTap: () {
                                      setState(() {
                                        _postalCode = !_postalCode;
                                      });
                                    },
                                    textAlign: TextAlign.start,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Postal Code"),
                                    onSubmitted: (code) {},
                                  ),
                                ),
                                _postalCode),
                            SizedBox(height: mediaQuery.height * 0.01),
                            // COUNTY OF RESiDANCE
                            LargeContainer(
                                context,
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        countryOfResidence.isEmpty
                                            ? 'Country Of Residence'
                                            : countryOfResidence,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      )),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (ctx) =>
                                                  CountryCodePicker(
                                                    dialogTextStyle:
                                                        Theme.of(context)
                                                            .textTheme
                                                            .headline2,
                                                    showCountryOnly: true,
                                                    onInit: (C) => C?.name,
                                                    dialogBackgroundColor:
                                                        Colors.white,
                                                    onChanged: (c) {
                                                      setState(() {
                                                        _areaOfResidence =
                                                            !_areaOfResidence;
                                                        countryOfResidence =
                                                            c.name!;
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    },
                                                  ));
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 40,
                                          color: Colors.black12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                _areaOfResidence),
                            SizedBox(height: mediaQuery.height * 0.01),
                            // POSTAL CODE

                            SizedBox(height: mediaQuery.height * 0.01),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Use Current Location',
                                      style: TextStyle(
                                          color: Colors.amber, fontSize: 18),
                                    ),
                                  ])),
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
                                            builder: (context) =>
                                                MobileScreen()));
                                  },
                                  child: Text(
                                    'Done',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ))
                          ])),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget SmallContainer(BuildContext context, Widget Child, bool choice) {
  return Container(
      // padding: EdgeInsets.only(
      //   left: MediaQuery.of(context).size.width * 0.04,
      //   right: MediaQuery.of(context).size.width * 0.04,
      //   top: MediaQuery.of(context).size.height * 0.02,
      // ),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: choice ? Theme.of(context).primaryColor : Colors.black12,
            width: 2),
      ),
      child: Center(child: Child));
}

Widget LargeContainer(BuildContext context, Widget Child, bool choice) {
  return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.06,
          right: MediaQuery.of(context).size.height * 0.03),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: choice ? Theme.of(context).primaryColor : Colors.black12,
            width: 2),
      ),
      child: Child);
}
