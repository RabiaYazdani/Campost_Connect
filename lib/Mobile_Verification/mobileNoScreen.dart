import 'package:campostconnect/Mobile_Verification/verificationScreen.dart';
import 'package:campostconnect/Constant_Widgets/back_to_previous_screen.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../Constant_Widgets/back_ground_image_widget.dart';
import 'header_widgets.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  bool _isSelected = false;
  String? mobileNo = "";
  String? countryCode = "";
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
                  padding: EdgeInsets.only(
                      left: mediaQuery.height * 0.06,
                      right: mediaQuery.width * 0.06),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderWidgets(
                        mediaQuery: mediaQuery,
                        subtext: 'Please Enter Your Mobile Number',
                        heading: 'Mobile Number',
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: _isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.black12,
                              width: 2,
                            )),
                        child: Row(
                          children: [
                            SizedBox(
                              child: CountryCodePicker(
                                enabled: true,
                                onInit: (c) {
                                  c?.code;
                                  countryCode = c?.dialCode;
                                },
                                onChanged: (c) {
                                  setState(() {
                                    c.name;
                                    countryCode = c.dialCode;
                                  });
                                },
                                initialSelection: 'PK',
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                favorite: const ['+92', 'PK'],
                                flagDecoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                onTap: () {
                                  setState(() {
                                    _isSelected = !_isSelected;
                                  });
                                },
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
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      Container(
                          padding:
                              EdgeInsets.only(top: mediaQuery.height * 0.01),
                          height: mediaQuery.height * 0.1,
                          width: mediaQuery.width,
                          child: ElevatedButton(
                            onPressed: () {
                              if (mobileNo!.isNotEmpty) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VerificationScreen(
                                                mobileNumber: countryCode! +
                                                    " " +
                                                    mobileNo!)));
                              } else {
                                return;
                              }
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
          ],
        ),
      ),
    );
  }
}
