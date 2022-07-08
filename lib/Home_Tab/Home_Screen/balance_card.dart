import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard(
      {Key? key,
      required this.color2,
      required this.color1,
      required this.savingType,
      required this.currentBalance})
      : super(key: key);
  final String savingType;
  final String currentBalance;
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.04,
      width: mediaQuery.width * 0.65,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color2, color1],
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: mediaQuery.height * 0.1,
                right: mediaQuery.width * 0.15),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ImageIcon(
                  AssetImage(
                    'assets/images/left_decor.png',
                  ),
                  size: 250,
                  color: color1,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: mediaQuery.height * 0.1),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ImageIcon(
                AssetImage(
                  'assets/images/right_decor.png',
                ),
                size: 200,
                color: color2,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: mediaQuery.width * 0.04,
              top: mediaQuery.height * 0.02,
              bottom: mediaQuery.height * 0.01,
              right: mediaQuery.width * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  savingType,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  'Current Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w100),
                ),
                Text(
                  currentBalance,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
