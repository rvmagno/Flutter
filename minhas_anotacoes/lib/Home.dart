import 'package:flutter/material.dart';
import 'package:minhas_anotacoes/helper/AnotacaoHelper.dart';
import 'package:minhas_anotacoes/model/Anotacao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao> _anotacoes = <Anotacao>[];

  _exibirTelaCadastro({Anotacao? anotacao}){

    String _txtAcao = "Salvar";
    _tituloController.text = "" ;
    _descricaoController.text = "" ;

    if(anotacao != null){
      _txtAcao = "Atualizar";
      _tituloController.text = anotacao.titulo! ;
      _descricaoController.text = anotacao.descricao! ;
    }



    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("$_txtAcao anotacao"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "titulo",
                    hintText: "digite titulo"
                  ),
                ),
                TextField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                    labelText: "descricao",
                    hintText: "digite descricao"
                  ),
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("cancelar")
              ),
              FlatButton(
                  onPressed: () {
                    _salvarAtualizarAnotacao(anotacaoSelecionada: anotacao);
                    Navigator.pop(context);
                  },
                  child: Text(_txtAcao)
              )
            ],
          );
        });
  }

  _recuperarAnotacoes() async {

    List recuperadas =  await _db.recuperarAnotacao();

    List<Anotacao>? tempList = <Anotacao>[];
    for(var item in recuperadas){
      Anotacao nota = Anotacao.fromMap(item);
      tempList.add(nota);
    }
    setState(() {
      _anotacoes = tempList!;
    });

    tempList = null;
  }

  _salvarAtualizarAnotacao({Anotacao? anotacaoSelecionada}) async {
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    // Salvando
    if(anotacaoSelecionada == null){
      Anotacao anotacao = Anotacao(titulo, descricao, DateTime.now().toString());
      var salvarAnotacao = await _db.salvarAnotacao(anotacao);
    }
    // Atualizando
    else{
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = DateTime.now().toString();
      int resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }

    _tituloController.clear();
    _descricaoController.clear();

    _recuperarAnotacoes();

  }
  _formatarData(String data){
    DateTime dtConvertida = DateTime.parse(data);
    initializeDateFormatting('pt_BR', null);
    var formatter = DateFormat("dd/MM/y H:m:s");
    // var formatter = DateFormat.yMd("pt_BR");

    return formatter.format(dtConvertida);
    // return data;
  }

  _removerAnotacao(int? id) async {
    
    await _db.removerAnotacao(id);

    _recuperarAnotacoes();
  }

  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("minhas anotacoes"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _anotacoes.length,
              itemBuilder: (context, index){
                final anotacao = _anotacoes[index];
                return Card(
                  child: ListTile(
                    title: Text("(${anotacao.id}) - ${anotacao.titulo!}"),
                    subtitle: Text("${_formatarData(anotacao.data!)} - ${anotacao.descricao}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: (){
                            _exibirTelaCadastro(anotacao: anotacao);
                          },
                        child:
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(
                                Icons.edit,
                                color: Colors.lightGreen,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            _removerAnotacao(anotacao.id);
                          },
                        child:
                          Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Icon(
                                Icons.remove,
                                color: Colors.redAccent,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: (){
          _exibirTelaCadastro();
        },
      ),
    );
  }
}
