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
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  bool primeiraExecucao = true;
  double _volume = 0.5;

  _executar() async {
    /*
    // String url2 = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3";
    String url6 = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3";
    var resultado = await audioPlayer.play(url6);
    if(resultado == 1){
      // sucesso
    }
    */
    audioPlayer.setVolume(_volume);
    if(primeiraExecucao){
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao = false;
    }
    else{
      audioPlayer.resume();
    }

  }

  _pausar() async{
    int resultado = await audioPlayer.pause();
    if(resultado == 1){
      print("pausar");
    }

  }

  _parar() async {
    int resultado = await audioPlayer.stop();
    if(resultado == 1){
      print("parar");
      primeiraExecucao = true;
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Exec sons"),),
      body: Column(
        children: [
          Slider(
            value: _volume,
            min: 0,
            max: 1,
            divisions: 10,
            onChanged: (novoVolume){
              setState(() {
                _volume = novoVolume;
              });
              audioPlayer.setVolume(_volume);
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    child: Image.asset("assets/images/pausar.png"),
                    onTap: (){
                      _pausar();
                    },
                  ),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    child: Image.asset("assets/images/executar.png"),
                    onTap: (){
                      _executar();
                    },
                  ),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    child: Image.asset("assets/images/parar.png"),
                    onTap: (){
                      _parar();
                    },
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


