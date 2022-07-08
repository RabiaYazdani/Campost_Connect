import 'package:campostconnect/Constant_Widgets/header_widget_2.dart';
import 'package:campostconnect/Setting_Screen/settings_screen.dart';
import 'package:flutter/material.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

List<String> amountList = ['\$10', '\$50', '\$100', '\$250', '\$300', 'others'];
int _value = 0;
int _monthValue = 0;
String amount = '';
String interestRate = '';
String amountWritten = "";
bool _interestSelected = false;
bool _amountSelected = false;

List<String> monthList = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final Color color = Color.fromRGBO(239, 239, 244, 1);
    return Scaffold(
        body: SafeArea(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/veri_background2.png')),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          headerWidget2(
                              mediaQuery: mediaQuery, label: 'Account'),
                          SizedBox(height: mediaQuery.height * 0.01),
                          Container(
                            height: mediaQuery.height * 0.16,
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.only(left: mediaQuery.width * 0.04),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromRGBO(50, 50, 50, 1),
                                    radius: 30,
                                    child: Image.asset('assets/images/key.png'),
                                  ),
                                ),
                                SizedBox(width: mediaQuery.width * 0.02),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Blocked Savings',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      textAlign: TextAlign.justify,
                                    ),
                                    Text(
                                      '4731 2234 ****',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                    onTap: () {},
                                    child:
                                        Icon(Icons.arrow_forward_ios_rounded)),
                              ],
                            ),
                          ),
                          SizedBox(height: mediaQuery.height * 0.01),
                          Text(
                            'Select The Amount',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(height: mediaQuery.height * 0.01),
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: _buildMoneyChips(mediaQuery),
                          ),
                          SizedBox(height: mediaQuery.height * 0.01),
                          Divider(
                            thickness: 4,
                          ),
                          Text(
                            'Select The Month',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Container(
                            height: mediaQuery.height * 0.1,
                            child: _buildMonthChips(mediaQuery),
                          ),
                          SizedBox(height: mediaQuery.height * 0.01),
                          Divider(
                            thickness: 4,
                          ),
                          Row(
                            children: [
                              Text('Interest Rate',
                                  style: Theme.of(context).textTheme.headline4),
                              SizedBox(
                                width: mediaQuery.width * 0.2,
                              ),
                              Text('Amount',
                                  style: Theme.of(context).textTheme.headline4)
                            ],
                          ),
                          Row(
                            children: [
                              _containerOutlined(
                                  TextField(
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                      decoration: InputDecoration.collapsed(
                                          hintText: ""),
                                      textAlign: TextAlign.center,
                                      onSubmitted: (text) {
                                        setState(() {
                                          interestRate = text;
                                        });
                                      },
                                      onTap: () {
                                        setState(() {
                                          _interestSelected =
                                              !_interestSelected;
                                        });
                                      },
                                      keyboardType: TextInputType.text),
                                  _interestSelected,
                                  color,
                                  mediaQuery),
                              Spacer(),
                              _containerOutlined(
                                  TextField(
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    decoration:
                                        InputDecoration.collapsed(hintText: ""),
                                    textAlign: TextAlign.center,
                                    onTap: () {
                                      setState(() {
                                        _amountSelected = !_amountSelected;
                                      });
                                    },
                                    onSubmitted: (text) {
                                      setState(() {
                                        interestRate = text;
                                      });
                                    },
                                    keyboardType: TextInputType.text,
                                  ),
                                  _amountSelected,
                                  color,
                                  mediaQuery),
                            ],
                          ),
                          SizedBox(height: mediaQuery.height * 0.02),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Confirmed the Subscription',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ],
                          ),
                          SizedBox(height: mediaQuery.height * 0.03),
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
                                              SettingsScreen()));
                                },
                                child: Text(
                                  'Submit',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ))
                        ]),
                  ),
                ))));
  }

  List<Widget> _buildMoneyChips(mediaQuery) {
    return List<Widget>.generate(amountList.length, (index) {
      return ChoiceChip(
        label: Container(
            height: mediaQuery.height * 0.07,
            width: mediaQuery.width * 0.2,
            padding: EdgeInsets.all(6),
            child: Center(
              child: Text(
                amountList[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            )),
        onSelected: (selected) {
          setState(() {
            _value = (selected ? index : null)!;
            amount = amountList[index];
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        selectedColor: Colors.amber,
        backgroundColor: Color.fromRGBO(239, 239, 244, 1),
        selected: _value == index,
      );
    });
  }

  _buildMonthChips(mediaQuery) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChoiceChip(
          label: Container(
              height: mediaQuery.height * 0.05,
              width: mediaQuery.width * 0.22,
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  monthList[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
              )),
          onSelected: (selected) {
            setState(() {
              _monthValue = (selected ? index : null)!;
              amount = monthList[index];
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          selectedColor: Colors.amber,
          backgroundColor: Color.fromRGBO(239, 239, 244, 1),
          selected: _monthValue == index,
        ),
      ),
      itemCount: monthList.length,
      scrollDirection: Axis.horizontal,
    );
  }

  _containerOutlined(Widget child, bool choice, Color color, mediaQuery) {
    return Container(
        height: mediaQuery.height * 0.08,
        width: mediaQuery.width * 0.4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
                color: choice ? Theme.of(context).primaryColor : Colors.black12,
                width: 2)),
        child: child);
  }
}
