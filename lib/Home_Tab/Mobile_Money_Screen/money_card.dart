import 'package:flutter/material.dart';
import 'gradient.dart';

class MoneyCard extends StatefulWidget {
  const MoneyCard(
      {Key? key,
      required this.accountId,
      required this.code,
      required this.imageLink,
      required this.color1,
      required this.color2})
      : super(key: key);
  final String imageLink;
  final String accountId;
  final String code;
  final Color color1;
  final Color color2;

  @override
  State<MoneyCard> createState() => _MoneyCardState();
}

class _MoneyCardState extends State<MoneyCard> {
  bool _switched = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.27,
      width: mediaQuery.width * 0.65,
      child: Stack(
        children: [
          GradientIcon(
            imagePath: 'assets/images/rect.png',
            size: mediaQuery.width,
            gradient: LinearGradient(
              colors: [
                widget.color2,
                widget.color1,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: mediaQuery.height * 0.06),
            child: Container(
              height: mediaQuery.height * 0.6,
              width: mediaQuery.width,
              child: GradientIcon(
                  imagePath: 'assets/images/style.png',
                  size: mediaQuery.width,
                  gradient: LinearGradient(
                    colors: [
                      widget.color2,
                      widget.color1,
                      widget.color1,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mediaQuery.height * 0.03,
              left: mediaQuery.width * 0.1,
              right: mediaQuery.width * 0.09,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: mediaQuery.height * 0.1,
                    width: mediaQuery.width * 0.17,
                    child: Image.asset(
                      widget.imageLink,
                    )),
                Text(
                  widget.accountId,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Switch.adaptive(
                        activeTrackColor: Colors.lightGreen,
                        thumbColor: MaterialStateProperty.all(Colors.white),
                        value: _switched,
                        onChanged: (value) {
                          setState(() {
                            _switched = value;
                          });
                        }),
                    Spacer(),
                    Container(
                      height: mediaQuery.height * 0.05,
                      width: mediaQuery.width * 0.3,
                      padding: EdgeInsets.only(
                          top: mediaQuery.height * 0.01,
                          left: mediaQuery.height * 0.03,
                          bottom: mediaQuery.height * 0.01,
                          right: mediaQuery.height * 0.01),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [widget.color1, widget.color2],
                              begin: Alignment.centerRight,
                              end: Alignment.bottomLeft)),
                      child: Text(widget.code,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 12)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
