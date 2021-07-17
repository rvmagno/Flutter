import 'package:flutter/material.dart';
import 'package:youtubis/CustomSearchDelegate.dart';
import 'package:youtubis/telas/Bibliotecas.dart';
import 'package:youtubis/telas/EmAlta.dart';
import 'package:youtubis/telas/Inicio.dart';
import 'package:youtubis/telas/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas =[
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),

    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData( color: Colors.grey, ),
        title: Image.asset(
          "images/youtubis.png",
          width: 98,
          height: 22,
          ),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String resultado = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = resultado;
              });
              print("acao: pesquisa -> $resultado");
            },
          ),


          /*
          IconButton(
            icon: Icon(Icons.videocam, ),
            onPressed: (){print("acao: videocam");},
          ),


          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){print("acao: conta");},
          ),
*/

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._indiceAtual,
        onTap: (indice){
          print("indice -> $indice");
          setState(() {
            this._indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text("inicio"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text("What?!"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            title: Text("inscricoes"),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            title: Text("biblioteca"),
            icon: Icon(Icons.folder)
          ),

        ],
      ),
    );
  }
}
