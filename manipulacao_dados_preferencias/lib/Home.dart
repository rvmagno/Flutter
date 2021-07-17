import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {
  String _textoSalvo = "Nada Salvo";

  _salvar() async {
    print("salvando..");
    String textoDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("nome", textoDigitado);
    print("salvando.. ${textoDigitado}");

  }
  _recuperar()async{
    print("recuperando");
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo = prefs.getString("nome") ?? "Sem valor";
    });
    print("recuperando.. ${_textoSalvo}");
  }
  _remover()async{
    print("removendo");
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("nome");
    });
    print("removido");
  }

  TextEditingController _controllerCampo = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("manipulacao de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              _textoSalvo,
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "digite algo"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Salvar",
                      style: TextStyle(fontSize: 20)
                  ),
                  onPressed: _salvar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Recuperar",
                      style: TextStyle(fontSize: 20)
                  ),
                  onPressed: _recuperar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Remover",
                      style: TextStyle(fontSize: 20)
                  ),
                  onPressed: _remover ,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
