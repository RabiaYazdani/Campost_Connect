import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options(
      {Key? key,
      required this.imageAsset,
      required this.nextScreen,
      required this.label})
      : super(key: key);
  final String imageAsset;
  final Widget nextScreen;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => nextScreen));
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Color.fromRGBO(239, 239, 244, 1),
            child: ImageIcon(
              AssetImage(
                imageAsset,
              ),
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(label, style: Theme.of(context).textTheme.subtitle1)
        ],
      ),
    );
  }
}
