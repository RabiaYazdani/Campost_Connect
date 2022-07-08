import 'package:flutter/material.dart';

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets(
      {Key? key,
      required this.mediaQuery,
      required this.heading,
      required this.subtext})
      : super(key: key);

  final Size mediaQuery;
  final String heading;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: mediaQuery.height * 0.04,
          ),
          child: Text(
            heading,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Text(subtext, style: Theme.of(context).textTheme.headline2),
        SizedBox(
          height: mediaQuery.height * 0.02,
        ),
      ],
    );
  }
}
