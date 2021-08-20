import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  var _groupValue = "";

  @override
  Widget build(BuildContext context) {

    TextStyle btnSalvar = TextStyle(fontSize: 20, color: Colors.black87);

    return Scaffold(
        appBar: AppBar(
        title: Text("Entrada de dados"),
    backgroundColor: Colors.blue,
    ),
    body: Container(
      child: Column(
        children: <Widget>[

          RadioListTile(
            title: Text("Masculino"),
            value: "M",
            groupValue: _groupValue,
            onChanged: (String escolha){
              setState(() {
                _groupValue = escolha;
              });
            },
          ),

          RadioListTile(
            title: Text("Feminino"),
            value: "F",
            groupValue: _groupValue,
            onChanged: (String escolha){
              setState(() {
                _groupValue = escolha;
              });
            },
          ),

          RaisedButton(
            child: Text("Salvar", style: btnSalvar,),
            onPressed: (){
              print("comida brasileira [$_groupValue] e comida mexicaba [$_groupValue]");
            },
          )

          /*
          Text("Masculino"),
          Radio(
            value: "M",
            groupValue: _groupValue,
            onChanged: (String escolha){
              setState(() {
                _groupValue = escolha;
              });
              print("escolha $escolha");
            },
          ),
          Text("Feminino"),
          Radio(
            value: "F",
            groupValue: _groupValue,
            onChanged: (String escolha){
              setState(() {
                _groupValue = escolha;
              });
              print("escolha $escolha");
            },
          )
          */

        ],
      ),
    )
    );
  }
}
