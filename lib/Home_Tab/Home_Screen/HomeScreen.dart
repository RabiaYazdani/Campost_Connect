import 'package:campostconnect/Home_Tab/Home_Screen/accounts_detail_Widget.dart';
import 'package:campostconnect/Home_Tab/Home_Screen/balance_card.dart';
import 'package:campostconnect/Home_Tab/Home_Screen/circular_widget.dart';
import 'package:campostconnect/Home_Tab/Home_Screen/top_up.dart';
import 'package:campostconnect/Home_Tab/Home_Screen/withdraw_widget.dart';
import 'package:campostconnect/withdraw_screen/withdraw_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    List<Saving> _saving = [
      Saving(
          color1: Colors.blue,
          color2: Color.fromRGBO(3, 62, 244, 1),
          currentBalance: '\$1200.49',
          savingType: 'Blocked Savings'),
      Saving(
          color1: Color.fromRGBO(250, 195, 3, 1),
          color2: Color.fromRGBO(244, 152, 3, 1),
          currentBalance: '\$1400.49',
          savingType: 'Classic Savings'),
    ];
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: mediaQuery.height * 0.07, left: mediaQuery.width * 0.09),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/veri_background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset('assets/images/drawer.png'),
              SizedBox(width: mediaQuery.width * 0.04),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello Adam",
                      style: Theme.of(context).textTheme.headline2),
                  Text('Welcome Back!',
                      style: Theme.of(context).textTheme.headline3),
                  Container(
                      padding: EdgeInsets.only(
                        left: mediaQuery.width * 0.02,
                        right: mediaQuery.width * 0.02,
                        top: mediaQuery.height * 0.01,
                        bottom: mediaQuery.height * 0.01,
                      ),
                      color: Color.fromRGBO(255, 245, 224, 1),
                      child: Text('Pending Validation',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(254, 168, 0, 1),
                          )))
                ],
              )
            ]),
            Container(
              height: mediaQuery.height * 0.24,
              width: mediaQuery.width,
              child: ListView.builder(
                  dragStartBehavior: DragStartBehavior.down,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => BalanceCard(
                      color1: _saving[index].color1,
                      color2: _saving[index].color2,
                      currentBalance: _saving[index].currentBalance,
                      savingType: _saving[index].savingType),
                  itemCount: _saving.length),
            ),
            SizedBox(
              height: mediaQuery.height * 0.04,
            ),
            Padding(
                padding: EdgeInsets.only(right: mediaQuery.width * 0.04),
                child: Column(children: [
                  Container(
                      height: mediaQuery.height * 0.15,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //  I ONLY HAD DESIGN OF WITHDRAW SCREEN SO I ADDED THAT
                            //  YOU CAN ADD OTHER SCREENS HERE BY SIMPLY REPLACING
                            //   THE OTHER WITHDRAW SCREEN WIDGET WITH NEW SCREENS

                            Options(
                                imageAsset: 'assets/images/transaction_2.png',
                                nextScreen: WithDrawScreen(),
                                label: 'Transactions'),
                            Options(
                                imageAsset: 'assets/images/Topup.png',
                                nextScreen: WithDrawScreen(),
                                label: 'Topup'),
                            Options(
                                imageAsset: 'assets/images/withdraw.png',
                                nextScreen: WithDrawScreen(),
                                label: 'Withdraw'),
                            Options(
                                imageAsset: 'assets/images/More.png',
                                nextScreen: WithDrawScreen(),
                                label: 'More'),
                          ])),
                  SizedBox(height: mediaQuery.height * 0.03),
                  Row(
                    children: [
                      Text('Last TopUp',
                          style: Theme.of(context).textTheme.headline4),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                          )),
                    ],
                  ),
                  Container(
                    height: mediaQuery.height * 0.25,
                    width: double.infinity,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) => TopUpWidget(
                              price: '\$143.33',
                              date:
                                  DateFormat('MMM d, H:mm a').format(dateTime),
                            ),
                        itemCount: 2),
                  ),
                  AccountDetailWidget(),
                  SizedBox(height: mediaQuery.height * 0.03),
                  Row(
                    children: [
                      Text('Last Withdraw',
                          style: Theme.of(context).textTheme.headline4),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WithDrawScreen()));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                          )),
                    ],
                  ),
                  Container(
                    height: mediaQuery.height * 0.25,
                    width: double.infinity,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) => WithDrawWidget(
                              price: '\$143.33',
                              date:
                                  DateFormat('MMM d, H:mm a').format(dateTime),
                            ),
                        itemCount: 2),
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}

class Saving {
  late String savingType;
  late String currentBalance;
  late Color color1;
  late Color color2;
  Saving(
      {required this.currentBalance,
      required this.savingType,
      required this.color1,
      required this.color2});
}
