import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Bichos extends StatefulWidget {
  const Bichos({Key? key}) : super(key: key);

  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {


  final _audiocache = AudioCache(prefix: "assets/audio");

  _executar(String nomeMedia){
    _audiocache.play("/"+nomeMedia+ ".mp3");
  }



  String _loadImg(String img){
    return "assets/images/" + img + ".png";
  }


  @override
  void initState() {
    super.initState();
    _audiocache.loadAll([
      "cao.mp3", "gato.mp3", "leao.mp3", "macaco.mp3", "ovelha.mp3", "vaca.mp3"
    ]);
  }

  @override
  Widget build(BuildContext context) {

    return
      // Center( child: Text("Primeira Pagina, bichos"), );
      GridView.count(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
          children: [
            GestureDetector(
              onTap: (){
                print("som do cão");
                _executar("cao");

              },
              child: Image.asset(_loadImg("cao")),
            ),
            GestureDetector(
              onTap: (){
                _executar("gato");
              },
              child: Image.asset(_loadImg("gato")),
            ),
            GestureDetector(
              onTap: (){
                _executar("leao");
              },
              child: Image.asset(_loadImg("leao")),
            ),
            GestureDetector(
              onTap: (){
                _executar("macaco");
              },
              child: Image.asset(_loadImg("macaco")),
            ),
            GestureDetector(
              onTap: (){
                _executar("ovelha");
              },
              child: Image.asset(_loadImg("ovelha")),
            ),
            GestureDetector(
              onTap: (){
                _executar("vaca");
              },
              child: Image.asset(_loadImg("vaca") ),
            ),

          ],
      );
  }
}

