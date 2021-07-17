import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return
      IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            close(context, query);
          })
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    print("resultado: pesquisa realizada -> $query");
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("resultado: digitado : " + query);

    // return Container();
    List<String> lista = List();
    if(query.isNotEmpty){
      lista = ["Android", "Android Navegacao", "iOS", "Jogos"].where((element) => element.toLowerCase().startsWith( query )).toList();
      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          }
      );
    }
    else{
      return Center(
        child: Text("Nenhum resultado, sorry"),
      );
    }
  }

}