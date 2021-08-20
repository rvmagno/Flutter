import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imgApp = AssetImage("images/padrao.png");
  var _msg = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    print ("usuario $escolhaUsuario");
    print ("app $escolhaApp");

    switch(escolhaApp){
      case "pedra":
       setState(() {
        this._imgApp = AssetImage("images/pedra.png");
       });
       break;
      case "papel":
       setState(() {
         this._imgApp = AssetImage("images/papel.png");
       });
       break;
      case "tesoura":
       setState(() {
         this._imgApp = AssetImage("images/tesoura.png");
       });
       break;
    }

    if(
      escolhaUsuario == "pedra"   && escolhaApp == "tesoura" ||
      escolhaUsuario == "tesoura" && escolhaApp == "papel" ||
      escolhaUsuario == "papel"   && escolhaApp == "pedra"
    ){
      setState(() {
        _msg = "Parabéns, você ganhou!";
      });

    } else if(
      escolhaApp == "pedra"   && escolhaUsuario == "tesoura" ||
      escolhaApp == "tesoura" && escolhaUsuario == "papel" ||
      escolhaApp == "papel"   && escolhaUsuario == "pedra"
    ) {
      setState(() {
        _msg = "O APP ganhou, que coisa.";
      });

    } else {
      setState(() {
        _msg = "Houve empate!";
      });

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //1) text
          //2) imagem
          //3) text resultado
          //4) Linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imgApp),
          /*
          GestureDetector(
            onTap: (){ print("Imagem apertada"); },
            onDoubleTap: (){ print("Imagem apertada twice"); },
            child: Image.asset("images/padrao.png"),

          ) ,
          */

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              /*
              Image.asset("images/pedra.png", height: 100,),
              Image.asset("images/papel.png", height: 100,),
              Image.asset("images/tesoura.png", height: 100,)
              */
              GestureDetector(onTap: () => _opcaoSelecionada("pedra"), child: Image.asset("images/pedra.png", height: 100,),),
              GestureDetector(onTap: () => _opcaoSelecionada("papel"), child: Image.asset("images/papel.png", height: 100,),),
              GestureDetector(onTap: () => _opcaoSelecionada("tesoura"), child: Image.asset("images/tesoura.png", height: 100,),),
            ],
          )
        ],
      ),
    );
  }
}
