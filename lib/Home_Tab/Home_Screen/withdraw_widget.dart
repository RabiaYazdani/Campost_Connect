import 'package:flutter/material.dart';

class WithDrawWidget extends StatelessWidget {
  const WithDrawWidget({Key? key, required this.date, required this.price})
      : super(key: key);
  final String date;
  final String price;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(bottom: mediaQuery.height * 0.008),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      height: mediaQuery.height * 0.12,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            left: mediaQuery.width * 0.03,
            right: mediaQuery.width * 0.03,
            top: mediaQuery.height * 0.01,
            bottom: mediaQuery.height * 0.01,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromRGBO(255, 122, 1, 1),
                child: ImageIcon(
                  AssetImage(
                    'assets/images/withdraw.png',
                  ),
                  size: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: mediaQuery.width * 0.03),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Withdraw',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      )),
                  Text(date, style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
              Spacer(),
              Text(price,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
