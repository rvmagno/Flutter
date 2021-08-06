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
    print("\n\n\nlistarUsuarios");

    Database bd = await _recuperarBancoDados();

    List usuarios = await bd.rawQuery("select * from usuarios ");

    for(var usuario in usuarios){
      print("usuario "+ usuario['id'].toString() +" nome " + usuario['nome'] + " com " + usuario['idade'].toString() +" anos" );
    }

    // print("### usuarios " + usuarios.toString());
  }

  _listarUsuarioPorId (int id) async {

    Database bd = await _recuperarBancoDados();

    List usuarios = await bd.query(
        "usuarios",
        columns: ["id", "nome", "idade"] ,
        where: "id = ?",
        whereArgs: [id]
        // "select * from usuarios where id = " + id.toString()
    );

    for(var usuario in usuarios){
      print("\n\n\n_listarUsuariosPorId: nome " + usuario['nome'] + " com " + usuario['idade'].toString() +" anos" );
    }

  }

  _excluirUsuarios(int id) async{
    print("\nexcluirUsuarios");
    Database bd = await _recuperarBancoDados();

    bd.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );

  }

  _atualizarNomeUsuario(int id, String nome) async{
    print("\natualizarrUsuarios");
    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": nome,
    };

    bd.update(
      "usuarios",
      dadosUsuario,
      where: "id = ?",
      whereArgs: [id]

    );

  }


  @override
  Widget build(BuildContext context) {

    // _recuperarBancoDados();
    // _salvar();
    _listarUsuarios();
    // _excluirUsuarios(3);
    // _listarUsuarios();
    _atualizarNomeUsuario(1);
    _listarUsuarios();

    return Container();
  }
}

