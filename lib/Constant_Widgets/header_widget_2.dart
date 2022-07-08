import 'package:flutter/material.dart';

class headerWidget2 extends StatelessWidget {
  const headerWidget2({Key? key, required this.mediaQuery, required this.label})
      : super(key: key);

  final Size mediaQuery;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_rounded, size: 30),
        ),
        SizedBox(
          width: mediaQuery.width * 0.18,
        ),
        Text(label,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}
