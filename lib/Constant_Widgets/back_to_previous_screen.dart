import 'package:flutter/material.dart';

class BackToPreviousScreen extends StatelessWidget {
  const BackToPreviousScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: mediaQuery.width * 0.03, top: mediaQuery.height * 0.03),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          height: mediaQuery.height * 0.08,
          width: mediaQuery.width * 0.13,
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
    );
  }
}
