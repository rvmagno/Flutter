import 'package:flutter/material.dart';
import 'package:tabbar/Bichos.dart';
import 'package:tabbar/Numeros.dart';
import 'package:tabbar/Vogais.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late TabController _tabController ;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this);
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
        title: Text("Abas"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.yellow
          ),
          controller: _tabController,
          tabs: [
            Tab(
              text: "Home",
              icon: Icon(Icons.home_outlined),
            ),
            Tab(
              text: "Email",
              icon: Icon(Icons.email_outlined),
            ),
            Tab(
              text: "Conta",
              icon: Icon(Icons.account_circle_outlined),
            ),

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Bichos(),
          Numeros(),
          Vogais()
        ],
      ),
    );
  }
}
