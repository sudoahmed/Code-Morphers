import 'package:flutter/material.dart';
import 'package:sol_ventus/screens/info_screen_1/info_screen_1.dart';
import 'package:sol_ventus/screens/info_screen_2/info_screen_2.dart';
import 'package:sol_ventus/screens/info_screen_3/info_screen_3.dart';
import 'package:sol_ventus/screens/info_screen_4/info_screen_4.dart';
import 'package:sol_ventus/screens/menu_screen/SolarDataChartsScreen.dart';
import 'package:sol_ventus/screens/menu_screen/menu_screen.dart';
import 'package:sol_ventus/screens/music_screen/music_sreen.dart';
import 'package:sol_ventus/screens/splash_screen/splash_screen.dart';
import 'package:sol_ventus/screens/welcome_screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sol Ventus',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/info1': (context) => const InfoScreen1(),
        '/info2': (context) => const InfoScreen2(),
        '/info3': (context) => const InfoScreen3(),
        '/info4': (context) => const InfoScreen4(),
        '/menuScreen': (context) => const MenuScreen(),
        '/musicScreen': (context) => const MusicScreen(),
        '/solarDataChartsScreen': (context) => const SolarDataChartScreen()
      },
    );
  }
}
