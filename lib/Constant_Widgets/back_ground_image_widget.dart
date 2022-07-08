import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage(
      {Key? key, required this.mediaQuery, required this.imagePath})
      : super(key: key);

  final Size mediaQuery;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQuery.height,
      width: mediaQuery.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                imagePath,
              ))),
    );
  }
}
