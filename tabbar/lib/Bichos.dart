import 'package:flutter/material.dart';

class Bichos extends StatefulWidget {
  const Bichos({Key? key}) : super(key: key);

  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {
  @override
  Widget build(BuildContext context) {

    return
      // Center( child: Text("Primeira Pagina, bichos"), );
      GridView.count(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
          children: [
            GestureDetector(
              onTap: (){
                print("som do cão");
              },
              child: Image.asset("assets/images/cao.png"),
            ),
            GestureDetector(
              onTap: (){},
              child: Image.asset("assets/images/gato.png"),
            ),
            GestureDetector(
              onTap: (){},
              child: Image.asset("assets/images/leao.png"),
            ),
            GestureDetector(
              onTap: (){},
              child: Image.asset("assets/images/macaco.png"),
            ),
            GestureDetector(
              onTap: (){},
              child: Image.asset("assets/images/ovelha.png"),
            ),
            GestureDetector(
              onTap: (){},
              child: Image.asset("assets/images/vaca.png"),
            ),

          ],
      );
  }
}

