import 'package:flutter/material.dart';

class Tabela extends StatefulWidget {
  const Tabela({Key? key}) : super(key: key);

  @override
  _TabelaState createState() => _TabelaState();
}

class _TabelaState extends State<Tabela> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Aqui vão as informações da tabela, quem joga com quem e qdo."),
    );
  }
}

