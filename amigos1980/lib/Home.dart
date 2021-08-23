import 'package:amigos1980/Classificacao.dart';
import 'package:amigos1980/Multas.dart';
import 'package:amigos1980/Tabela.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Amigos 1980"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "Tabela",
            ),
            Tab(
              text: "Classificacao",
            ),
            Tab(
              text: "Multas",
            ),

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Tabela(),
          Classificacao(),
          Multas()
        ],

      ),
    );
  }
}
