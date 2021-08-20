import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool _selectedBrasileira = false;
  bool _selectedMexicana = false;
  TextStyle btnSalvar = TextStyle(fontSize: 20, color: Colors.black87);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrada de dados"),
          backgroundColor: Colors.blue,
        ),
      body: Container(
        child: Column(
          children: <Widget>[
/*

            Text("Comida Brasleira"),
            Checkbox(
              value: _selected,
              onChanged: (bool valor){
                print(valor.toString());
                setState(() {
                  _selected = valor;
                });
              },
            ),
*/

          CheckboxListTile(
            title: Text("Comida Brasleira"),

            value: _selectedBrasileira,
              onChanged: (bool valor){
                print(valor.toString());
                setState(() {
                  _selectedBrasileira = valor;
                });
              }

          ),
            CheckboxListTile(
            title: Text("Comida Mexicana"),

            value: _selectedMexicana,
              onChanged: (bool valor){
                print(valor.toString());
                setState(() {
                  _selectedMexicana = valor;
                });
              }

          ),
          RaisedButton(
           child: Text("Salvar", style: btnSalvar,),
            onPressed: (){
             print("comida brasileira [$_selectedBrasileira] e comida mexicaba [$_selectedMexicana]");
            },
          )

        ],
        ),
      )
    );
  }
}
