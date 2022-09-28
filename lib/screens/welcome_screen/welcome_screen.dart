import 'package:flutter/material.dart';
import 'package:sol_ventus/constants/style_constants.dart';

import '../../shared_components/info_paragraph_widget.dart';
import '../../shared_components/type_writer_animated_title.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/info1');
        },
        child: const Icon(
          Icons.arrow_forward,
          size: 32,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/night.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const TypeWriterAnimTitle(
                  animatedTitle:
                      'Hey\n\nWelcome to the Sol Ventus\n\nSpace Traveller',
                  alignment: Alignment.center,
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const InfoParaText(
                    infoText:
                        "Sol Ventus is a Latin term means 'Sun Wind'. This App is related to Solar Wind, it's effects and much much more. This app will make you feel the things you can't experience while being on earth.",
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    child: const Text(
                      'What you can experience here is: ',
                      style: kDescTextStyle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    child: Text(
                      '•\tFeel the solar winds in a Space Car simulation.',
                      style:
                          kDescTextStyle.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    child: Text(
                      '•\tListen to the Space Music generated from realtime space radiation particle data.',
                      style:
                          kDescTextStyle.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    child: Text(
                      '•\tFeel the intensity of Realtime Solar Winds in form of vibrations on your palm.',
                      style:
                          kDescTextStyle.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    child: Text(
                      '•\tSolar Wind and Particles data charts of past 7 days for Space Enthusiasts.',
                      style:
                          kDescTextStyle.copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
