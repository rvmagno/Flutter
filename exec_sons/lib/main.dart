import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");


  _executar() async {
    /*
    // String url2 = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3";
    String url6 = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3";
    var resultado = await audioPlayer.play(url6);
    if(resultado == 1){
      // sucesso
    }
    */
    audioPlayer = await audioCache.play("musica.mp3");
  }


  @override
  Widget build(BuildContext context) {
    _executar();
    return Container();
  }
}


