import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Numeros extends StatefulWidget {
  const Numeros({Key? key}) : super(key: key);

  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {


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
      "1.mp3", "2.mp3", "3.mp3", "4.mp3", "5.mp3", "6.mp3",
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text("Segunda Pagina, numeros"),
    // );


    //
    // return Container(
    //   child:
    //     ExpansionPanelList(
    //     expansionCallback: (int index, bool isExpanded) {},
    //     children: [
    //
    //       ExpansionPanel(
    //         headerBuilder: (BuildContext context, bool isExpanded) {
    //           return ListTile(
    //             title: Text('Item 1'),
    //           );
    //         },
    //         body: ListTile(
    //           title: Text('Item 1 child'),
    //           subtitle: Text('Details goes here'),
    //         ),
    //         isExpanded: true,
    //       ),
    //       ExpansionPanel(
    //         headerBuilder: (BuildContext context, bool isExpanded) {
    //           return ListTile(
    //             title: Text('Item 2'),
    //           );
    //         },
    //         body: ListTile(
    //           title: Text('Item 2 child'),
    //           subtitle: Text('Details goes here'),
    //         ),
    //         isExpanded: false,
    //       ),
    //
    //     ],
    //   )
    // );



    // Center( child: Text("Primeira Pagina, bichos"), );
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: [
        GestureDetector(
          onTap: (){
            print("som do um");
            _executar("1");

          },
          child: Image.asset(_loadImg("1")),
        ),
        GestureDetector(
          onTap: (){
            _executar("2");
          },
          child: Image.asset(_loadImg("2")),
        ),
        GestureDetector(
          onTap: (){
            _executar("3");
          },
          child: Image.asset(_loadImg("3")),
        ),
        GestureDetector(
          onTap: (){
            _executar("4");
          },
          child: Image.asset(_loadImg("4")),
        ),
        GestureDetector(
          onTap: (){
            _executar("5");
          },
          child: Image.asset(_loadImg("5")),
        ),
        GestureDetector(
          onTap: (){
            _executar("6");
          },
          child: Image.asset(_loadImg("6")),
        ),

      ],
    );
  }
}
