import 'package:flutter/material.dart';

import '../../shared_components/info_paragraph_widget.dart';
import '../../shared_components/type_writer_animated_title.dart';

class InfoScreen2 extends StatefulWidget {
  const InfoScreen2({Key? key}) : super(key: key);

  @override
  State<InfoScreen2> createState() => _InfoScreen2State();
}

class _InfoScreen2State extends State<InfoScreen2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
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
          Navigator.pushNamed(context, '/info3');
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
              children: [
                const SizedBox(
                  height: 45,
                ),
                const TypeWriterAnimTitle(
                  animatedTitle: 'What is Solar Weather ?',
                  alignment: Alignment.topLeft,
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Image.asset(
                    'assets/images/gifs/solar-wind.gif', //TODO:Change it to respective image of Solar Weather!!!
                    width: 300,
                    height: 300,
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const InfoParaText(
                      infoText:
                          "Space doesn’t have air, but it does have weather. This weather comes from the Sun: the high-energy light emitted by the Sun and the electrically charged particles known as the solar wind, which can have a profound effect on Earth and other worlds in the Solar SystemSpace weather can produce electromagnetic fields that induce extreme currents in wires, disrupting power lines, and even causing widespread power outages. Severe space weather also produces solar energetic particles, which can damage satellites used for commercial communications, global positioning, intelligence gathering and weather forecasting."),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
