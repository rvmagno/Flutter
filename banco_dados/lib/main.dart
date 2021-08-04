import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =  path.join(caminhoBancoDados, "banco.db") ;

    var bd = await openDatabase(
        localBancoDados,
        version: 1,
        onCreate: (db, versaoRecente){
          String sql = "CREATE TABLE  usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) " ;

          db.execute(sql);
        }
    );
    // print("aberto: " + bd.isOpen.toString());
    return bd;
  }

  _salvar () async {

    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": "Rogerio",
      "idade": 53
    };
    int id = await bd.insert("usuarios", dadosUsuario);

    print("### Salvo com id $id ###");
  }

  _listarUsuarios () async {

    Database bd = await _recuperarBancoDados();

    List usuarios = await bd.rawQuery("select * from usuarios ");

    for(var usuario in usuarios){
      print("usuario nome " + usuario['nome'] + " com " + usuario['idade'].toString() +" anos" );
    }

    // print("### usuarios " + usuarios.toString());
  }

  _listarUsuariosPorId (int id) async {

    Database bd = await _recuperarBancoDados();

    List usuarios = await bd.rawQuery("select * from usuarios where id = " + id.toString());

    for(var usuario in usuarios){
      print("_listarUsuariosPorId: nome " + usuario['nome'] + " com " + usuario['idade'].toString() +" anos" );
    }

    // print("### usuarios " + usuarios.toString());
  }

  @override
  Widget build(BuildContext context) {

    // _recuperarBancoDados();
    // _salvar();
    // _listarUsuarios();
    _listarUsuariosPorId(3);

    return Container();
  }
}

