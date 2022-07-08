import 'package:campostconnect/Constant_Widgets/back_ground_image_widget.dart';
import 'package:flutter/material.dart';
import '../ID_SCREEN/id_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          BackGroundImage(
              imagePath: 'assets/images/background.png',
              mediaQuery: mediaQuery),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset('assets/images/logo.png')),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Easy Banking With Simple Way",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: mediaQuery.width * 0.04,
                  right: mediaQuery.width * 0.04,
                  bottom: mediaQuery.height * 0.02,
                ),
                child: const Text(
                  "Connect Your money to your friends, family & experience",
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: mediaQuery.height * 0.12,
                width: mediaQuery.width,
                padding: EdgeInsets.only(
                    left: mediaQuery.width * 0.04,
                    right: mediaQuery.width * 0.04,
                    bottom: mediaQuery.height * 0.03),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(IDScreen.route);
                  },
                  child: Text(
                    "Get Started",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
