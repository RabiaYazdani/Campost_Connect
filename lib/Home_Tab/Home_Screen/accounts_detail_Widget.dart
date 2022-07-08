import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailWidget extends StatelessWidget {
  const AccountDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.22,
      width: mediaQuery.width,
      decoration: BoxDecoration(
          color: Color.fromRGBO(236, 201, 18, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: mediaQuery.width * 0.03,
                  right: mediaQuery.width * 0.01,
                  top: mediaQuery.height * 0.01,
                  bottom: mediaQuery.height * 0.02),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromRGBO(237, 208, 40, 1),
                ),
              )),
          Padding(
              padding: EdgeInsets.only(
                  left: mediaQuery.width * 0.01,
                  right: mediaQuery.width * 0.2,
                  top: mediaQuery.height * 0.02,
                  bottom: mediaQuery.height * 0.02),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromRGBO(237, 208, 50, 1),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(
                top: mediaQuery.height * 0.1, left: mediaQuery.width * 0.6),
            child: Align(
                alignment: Alignment.bottomRight,
                child: ImageIcon(
                  AssetImage(
                    'assets/images/sidecircle.png',
                  ),
                  color: Color.fromRGBO(237, 238, 60, 1),
                  size: 140,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: mediaQuery.width * 0.06,
                right: mediaQuery.width * 0.03,
                top: mediaQuery.height * 0.02,
                bottom: mediaQuery.height * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    ''
                    'Accounts Details',
                    style: Theme.of(context).textTheme.headline3),
                SizedBox(height: mediaQuery.height * 0.02),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mauris sem,',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
