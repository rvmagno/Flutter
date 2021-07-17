import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {

    List<Post> postagens = new List();
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = jsonDecode(response.body);

    for( var post in dadosJson ){
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return postagens;
  }

  _post() async {
    print ("post");
    Post post = new Post(120, null, "my title", "my body, rules of God");

    var _corpo = json.encode(post.toJson());
    http.Response response = await http.post(
      _urlBase + "/posts",
      headers: {'Content-type': 'application/json; charset=UTF-8',},
      body: _corpo
    );

    print ("Resposta ${response.statusCode}");
    print ("Resposta ${response.body}");

  }
  _put() async {
    print ("put");
    Post post = new Post(120, 2, "my title", "my body, rules of God");
    var _corpo = json.encode(post.toJson());
    http.Response response = await http.put(
        _urlBase + "/posts/2",
        headers: {'Content-type': 'application/json; charset=UTF-8',},
        body: _corpo
    );

    print ("Resposta ${response.statusCode}");
    print ("Resposta ${response.body}");

  }
  _patch() async{
    print ("patch");
    Post post = new Post(null, null, null, "my body, rules of God");
    var _corpo = json.encode(post.toJson());
    http.Response response = await http.patch(
        _urlBase + "/posts/2",
        headers: {'Content-type': 'application/json; charset=UTF-8',},
        body: _corpo
    );

    print ("Resposta ${response.statusCode}");
    print ("Resposta ${response.body}");

  }
  _delete() async {
    print ("delete");
    http.Response response = await http.delete(
        _urlBase + "/posts/2",
        headers: {'Content-type': 'application/json; charset=UTF-8',},
    );

    print ("Resposta ${response.statusCode}");
    print ("Resposta ${response.body}");

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de servico avancado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: _post,
                ),
                RaisedButton(
                  child: Text("Atualizar"),
                  onPressed: _put,
                ),
                RaisedButton(
                  child: Text("Remover"),
                  onPressed: _delete,
                ),
              ],
            ),

            Expanded(

              child: FutureBuilder<List<Post>>(
                future: _recuperarPostagens(),
                builder: (context, snapshot){

                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Center(
                        child:  CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.done:
                      if(snapshot.hasError){
                        print("Erro ao carregar");
                      }
                      else{
                        print("Lista carregou");
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index){

                              List<Post> lista = snapshot.data;
                              Post post = lista[index];

                              return ListTile(
                                title: Text( post.title ),
                                subtitle: Text( post.body ),
                              );

                            }
                        );
                      }
                      break;
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
