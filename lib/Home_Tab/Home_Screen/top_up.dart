import 'package:flutter/material.dart';

class TopUpWidget extends StatelessWidget {
  const TopUpWidget({Key? key, required this.date, required this.price})
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
                backgroundColor: Theme.of(context).primaryColor,
                child: ImageIcon(
                  AssetImage(
                    'assets/images/Topup.png',
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
                  Text('TopUp',
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
