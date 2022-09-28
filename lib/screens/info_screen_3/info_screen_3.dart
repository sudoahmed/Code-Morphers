import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../shared_components/info_paragraph_widget.dart';
import '../../shared_components/type_writer_animated_title.dart';

class InfoScreen3 extends StatefulWidget {
  const InfoScreen3({Key? key}) : super(key: key);

  final String url = 'https://www.youtube.com/watch?v=T_TQ8DRw8j8';

  @override
  State<InfoScreen3> createState() => _InfoScreen3State();
}

class _InfoScreen3State extends State<InfoScreen3> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=T_TQ8DRw8j8")!,
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
    Future.delayed(const Duration(seconds: 3), () {
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
          Navigator.pushNamed(context, '/info4');
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
                  height: 40,
                ),
                const TypeWriterAnimTitle(
                  animatedTitle: 'Why Space Weather is so Important ?',
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(
                  height: 20,
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
                          "Studying space weather provides insights into the behavior of the Sun as a star, and helps us understand how the Sun affects the planets, asteroids, and other Solar System bodies. By studying space weather we can devise a method that can save satellites and solar bodies from destruction."),
                ),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const InfoParaText(
                    infoText:
                        "	• Space weather can change the orbits of satellites\n\n• They interfere with onboard electronics also causing them damage\n\n• Shorten their life time and causes loss of fortune to space agencies and satellite communications agencies.",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
