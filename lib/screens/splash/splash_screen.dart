import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sol_ventus/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedSplashScreen(
        // centered: false,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black,
        animationDuration: const Duration(milliseconds: 1500),
        splashIconSize: 500,
        splash: 'assets/images/splash_final.png',
        nextScreen: const WelcomeScreen(),
      ),
    );
  }
}
