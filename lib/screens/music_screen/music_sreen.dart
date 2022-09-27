import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../shared_components/info_paragraph_widget.dart';
import '../../shared_components/type_writer_animated_title.dart';
import 'package:lottie/lottie.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
   late Uint8List audiobytes;

  
  @override
  void dispose(){
    player.dispose();
    super.dispose();
  }
   

  
  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration.zero, () async {

       ByteData bytes = await rootBundle.load("assets/music/sampleaudio.mp3"); //load audio from assets
       audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
       
       //convert ByteData to Uint8List

      
       });

       

       player.onDurationChanged.listen((newDuration) {
        setState(() {
          duration  = newDuration;

        });
       });

       player.onPositionChanged.listen((newPosition) {
        position = newPosition;
        });
       player.onPlayerComplete.listen((event) {
        setState(() {
          isPlaying=false;
        });
       });

    
    
    
  }

  // bool _isVisible = false;

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // _controller.play();

    return Scaffold(
      
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
                Lottie.asset('assets/images/astronauty.json', width: width * 0.3,),
                SizedBox(height: height*0.1,),
                Slider(
                  

                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(), onChanged: (value)async{

                    setState(() {
                      
                      position = Duration(seconds: value.toInt());
                      player.seek(position);
                      
                    });

                }),

                CircleAvatar(
                  radius: width*0.1,
                  child: IconButton(
                    onPressed: ()async{

                      if(isPlaying){
                        await player.pause();
                        
                      }
                      else{
                        // await player.setSourceAsset("assets/music/sampleaudio.mp3");
                        await player.play(AssetSource("music/sampleaudio.mp3"));
                        
                          
                        
                      }
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow)),
                ),




                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
