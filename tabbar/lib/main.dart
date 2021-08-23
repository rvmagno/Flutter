import 'package:flutter/material.dart';
import 'package:tabbar/PrimeiraPagina.dart';
import 'package:tabbar/SegundaPagina.dart';
import 'package:tabbar/TerceiraPagina.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
));

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
          PrimeiraPagina(),
          SegundaPagina(),
          TerceiraPagina()
        ],
      ),
    );
  }
}
