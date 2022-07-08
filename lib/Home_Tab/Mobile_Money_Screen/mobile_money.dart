import 'package:camera/camera.dart';
import 'package:campostconnect/Home_Tab/Mobile_Money_Screen/money_card.dart';
import 'package:flutter/material.dart';

class MobileMoneyScreen extends StatelessWidget {
  const MobileMoneyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final List<moneyClass> _moneyData = [
      moneyClass(
          imagePath: 'assets/images/mtn.png',
          code: '550.979 XAF',
          accountId: '00237 789 909 875',
          color2: Color.fromRGBO(220, 208, 46, 1),
          color1: Color.fromRGBO(233, 184, 11, 1)),
      moneyClass(
          imagePath: 'assets/images/orange.png',
          code: '550.979 XAF',
          accountId: '00237 789 909 875',
          color2: Colors.orange,
          color1: Colors.deepOrange),
      moneyClass(
          imagePath: 'assets/images/sfr.png',
          code: '550.979 XAF',
          accountId: '00237 789 909 875',
          color2: Colors.red,
          color1: Colors.pink),
    ];
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(
          top: mediaQuery.height * 0.05,
          left: mediaQuery.width * 0.08,
          right: mediaQuery.width * 0.05),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/veri_background2.png'),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Mobile Money',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, size: 30, color: Colors.black38)),
              ],
            ),
            SizedBox(height: mediaQuery.height * 0.02),
            Container(
              height: mediaQuery.height * 0.7,
              child: ListView.builder(
                  itemBuilder: (ctx, index) => MoneyCard(
                        color1: _moneyData[index].color1,
                        color2: _moneyData[index].color2,
                        code: _moneyData[index].code,
                        accountId: _moneyData[index].accountId,
                        imageLink: _moneyData[index].imagePath,
                      ),
                  itemCount: _moneyData.length),
            ),
            SizedBox(height: mediaQuery.height * 0.02),
          ],
        ),
      ),
    );
  }
}

class moneyClass {
  late String imagePath;
  late String accountId;
  late String code;
  late Color color1;
  late Color color2;

  moneyClass({
    required this.imagePath,
    required this.code,
    required this.accountId,
    required this.color2,
    required this.color1,
  });
}
