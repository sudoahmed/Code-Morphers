import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../shared_components/info_paragraph_widget.dart';
import '../../shared_components/type_writer_animated_title.dart';

class InfoScreen4 extends StatefulWidget {
  const InfoScreen4({Key? key}) : super(key: key);

  @override
  State<InfoScreen4> createState() => _InfoScreen4State();
}

class _InfoScreen4State extends State<InfoScreen4> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=AzDa9bJykBY")!,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
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
    // _controller.play();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/musicscreen'); //TODO: Add Main Menu Navigation!!!;
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
                  animatedTitle: 'What is Parker Solar Probe ?',
                  alignment: Alignment.topLeft,
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: YoutubePlayer(
                    controller: _controller,
                    liveUIColor: Colors.amber,
                    // width: 300,
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const InfoParaText(
                      infoText:
                          "Parker solar probe is NASA’s solar probe which was launched on 2018 with the mission to unlock the mysteries of the Sun's corona(most hazardous region of the sun whose temperature is above 2 million Fahrenheit degrees) and solar wind. This spacecraft uses breakthrough technology and autonomy to endure heat and radiation and it orbits within 4 million miles of our star's surface to directly study the formation of the solar wind"),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child:
                      const InfoParaText(infoText: "What does solar probe do?"),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const InfoParaText(
                    infoText:
                        "	• It photographs Sun's Structure\n\n • Collect the data related to Magnetic field disruption caused by solar winds\n\n • Collects data of Energetic particles released in Space by Coronal Mass Emissions(CME).",
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
