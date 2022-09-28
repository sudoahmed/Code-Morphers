import 'package:flutter/material.dart';
import 'package:sol_ventus/shared_components/info_paragraph_widget.dart';
import 'package:sol_ventus/shared_components/type_writer_animated_title.dart';

class InfoScreen1 extends StatefulWidget {
  const InfoScreen1({Key? key}) : super(key: key);

  @override
  State<InfoScreen1> createState() => _InfoScreen1State();
}

class _InfoScreen1State extends State<InfoScreen1> {
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
          Navigator.pushNamed(context, '/info2');
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
                  animatedTitle: 'What is Solar Wind ?',
                  alignment: Alignment.topLeft,
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Image.asset(
                    'assets/images/gifs/solar-wind.gif', //
                    width: 300,
                    height: 300,
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const InfoParaText(
                      infoText:
                          'The solar wind is a stream of charged particles released from the upper atmosphere of the Sun, called the corona. This plasma mostly consists of electrons, protons and alpha particles with kinetic energy between 0.5 and 10 keV. The composition of the solar wind plasma also includes a mixture of materials found in the solar plasma: trace amounts of heavy ions and atomic nuclei such as C, N, O, Ne, Mg, Si, S, and Fe. There are also rarer traces of some other nuclei and isotopes such as P, Ti, Cr, 54Fe and 56Fe, and 58Ni, 60Ni, and 62Ni.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
