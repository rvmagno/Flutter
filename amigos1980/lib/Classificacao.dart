import 'package:flutter/material.dart';

class Classificacao extends StatefulWidget {
  const Classificacao({Key? key}) : super(key: key);

  @override
  _ClassificacaoState createState() => _ClassificacaoState();
}

class _ClassificacaoState extends State<Classificacao> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Aqui vão as informações da classificação, qtos pontos cada equipe tem, os artilheiros, goleiros menos vazados "),
    );
  }
}
