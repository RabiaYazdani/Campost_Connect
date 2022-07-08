import 'package:camera/camera.dart';
import 'package:campostconnect/Constant_Widgets/constParameters.dart';
import 'package:campostconnect/Home_Tab/tab_screen.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'ID_SCREEN/id_screen.dart';
import 'SplashScreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConstantParameters.cameraList();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh")
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.amber,
        primaryColor: const Color.fromRGBO(0, 26, 255, 1),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(0, 26, 255, 1)))),
        textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 20, color: Colors.white),
            bodyText2:
                TextStyle(fontSize: 18, color: Color.fromRGBO(0, 26, 255, 1)),
            headline1: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
            subtitle1: TextStyle(
              fontSize: 12,
            ),
            headline2: TextStyle(fontSize: 16, color: Colors.black),
            headline4: TextStyle(fontSize: 20, color: Colors.black),
            headline3: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black)),
      ),
      home: SplashScreen(),
      routes: {
        IDScreen.route: (ctx) => const IDScreen(),
      },
    );
  }
}
