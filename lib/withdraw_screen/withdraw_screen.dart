import 'package:campostconnect/Constant_Widgets/header_widget_2.dart';

import 'package:campostconnect/Transaction_Confirmation/transaction_confirmation.dart';
import 'package:flutter/material.dart';

class WithDrawScreen extends StatefulWidget {
  const WithDrawScreen({Key? key}) : super(key: key);

  @override
  State<WithDrawScreen> createState() => _WithDrawScreenState();
}

String initialChoice = 'Blocked Savings';
List<String> savingOptions = [
  'Blocked Savings',
  'Lorem Ipsum',
  'Lorem Ipsum 2'
];
String userNumber = "";
String amount = '';
final Color color = Color.fromRGBO(174, 174, 174, 1);

List<String> amountList = ['\$10', '\$50', '\$100', '\$250', '\$300', 'others'];
int _value = 0;

class _WithDrawScreenState extends State<WithDrawScreen> {
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
                image: AssetImage('assets/images/veri_background2.png')),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  headerWidget2(mediaQuery: mediaQuery, label: 'Withdraw'),
                  SizedBox(height: mediaQuery.height * 0.06),
                  Container(
                    height: mediaQuery.height * 0.56,
                    width: mediaQuery.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Choose your Account',
                                style: Theme.of(context).textTheme.bodyText2),
                            SizedBox(
                              height: mediaQuery.height * 0.01,
                            ),
                            DropdownButton<String>(
                              items: savingOptions
                                  .map((saving) => DropdownMenuItem<String>(
                                        child: Text(
                                          saving,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        value: saving,
                                      ))
                                  .toList(),
                              value: initialChoice,
                              underline: Text(''),
                              iconSize: mediaQuery.height * 0.04,
                              icon: Icon(Icons.keyboard_arrow_down),
                              onChanged: (saving) {
                                setState(() {
                                  initialChoice = saving!;
                                });
                              },
                              isExpanded: true,
                            ),
                            Divider(thickness: 2),
                            SizedBox(
                              height: mediaQuery.height * 0.01,
                            ),
                            Text('Phone Number',
                                style: Theme.of(context).textTheme.bodyText2),
                            TextField(
                              style: Theme.of(context).textTheme.headline3,
                              keyboardType: TextInputType.number,
                              onSubmitted: (number) {
                                userNumber = number;
                              },
                            ),
                            SizedBox(
                              height: mediaQuery.height * 0.01,
                            ),
                            Text('Choose Amount',
                                style: Theme.of(context).textTheme.bodyText2),
                            SizedBox(
                              height: mediaQuery.height * 0.01,
                            ),
                            Wrap(
                              runSpacing: 10,
                              spacing: 10,
                              children: List<Widget>.generate(amountList.length,
                                  (index) {
                                return ChoiceChip(
                                  label: Container(
                                      height: mediaQuery.height * 0.05,
                                      width: mediaQuery.width * 0.16,
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        amountList[index],
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
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
                                  backgroundColor:
                                      Color.fromRGBO(239, 239, 244, 1),
                                  selected: _value == index,
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
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
                          showModalBottomSheet(
                              isDismissible: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (ctx) => Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: TransactionConfirmationScreen(),
                                  ));
                        },
                        child: Text(
                          'Submit',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
