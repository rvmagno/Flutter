import 'package:minhas_anotacoes/model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotacaoHelper {

  static final String tbAnotacao = "anotacao";
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database? _db ;

  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal(){
  }

  get db async {

    if( _db != null ){
      return _db;
    }else{
      _db = await inicializarDB();
      return _db;
    }

  }

  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $tbAnotacao ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        " titulo VARCHAR, "
        " descricao TEXT,"
        " data DATETIME)";
    await db.execute(sql);

  }

  inicializarDB() async{
    final caminhoBandoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBandoDados, "bd_minahs_anotacoes.db");

    var db = await openDatabase(
        localBancoDados,
        version: 1,
        onCreate: _onCreate
    );

    return db;
  }

  Future<int> salvarAnotacao(Anotacao anotacao) async {

    var bancoDados = await db;

    int resultado = await bancoDados.insert(tbAnotacao, anotacao.toMap());
    return resultado;
  }

  recuperarAnotacao() async {

    var bancoDados = await db;
    String sql = "SELECT * FROM $tbAnotacao ORDER BY data DESC ";
    List anotacoes = await bancoDados.rawQuery(sql);

/*
    String gambiarra = "SELECT * FROM $tbAnotacao WHERE id <= 2 ORDER BY data DESC ";
    List anotacoesGambiarra = await bancoDados.rawQuery(sql);



    List<Anotacao>? tempList = <Anotacao>[];
    for(var item in anotacoesGambiarra){
      Anotacao nota = Anotacao.fromMap(item);
      tempList.add(nota);
    }

    for(var nota in tempList){
      print(nota.data);
      nota.data = DateTime.now().toString();
      print(nota.data);
      await bancoDados.update(
          tbAnotacao,
          nota.toMap(),
          where: "id = ?",
          whereArgs: [nota.id]
      );
      print("\nnota.toString()");
      print(nota.toString());

    }

    print ("\n\n\n\n\nfuncionou, carai");
*/


    return anotacoes;

  }

  atualizarAnotacao(Anotacao anotacao) async {
    var bancoDados = await db;

    return await bancoDados.update(
      tbAnotacao,
      anotacao.toMap(),
      where: "id = ?",
      whereArgs: [anotacao.id]
    );

  }

}

/*

class Normal {

  Normal(){

  }

}

class Singleton {

  static final Singleton _singleton = Singleton._internal();

  	factory Singleton(){
      print("Singleton");
      return _singleton;
    }

    Singleton._internal(){
    	print("_internal");
  	}

}

* */