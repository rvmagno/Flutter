import 'package:flutter/material.dart';

class Numeros extends StatefulWidget {
  const Numeros({Key? key}) : super(key: key);

  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Segunda Pagina, numeros"),
    );
    //
    // return Container(
    //   child:
    //     ExpansionPanelList(
    //     expansionCallback: (int index, bool isExpanded) {},
    //     children: [
    //
    //       ExpansionPanel(
    //         headerBuilder: (BuildContext context, bool isExpanded) {
    //           return ListTile(
    //             title: Text('Item 1'),
    //           );
    //         },
    //         body: ListTile(
    //           title: Text('Item 1 child'),
    //           subtitle: Text('Details goes here'),
    //         ),
    //         isExpanded: true,
    //       ),
    //       ExpansionPanel(
    //         headerBuilder: (BuildContext context, bool isExpanded) {
    //           return ListTile(
    //             title: Text('Item 2'),
    //           );
    //         },
    //         body: ListTile(
    //           title: Text('Item 2 child'),
    //           subtitle: Text('Details goes here'),
    //         ),
    //         isExpanded: false,
    //       ),
    //
    //     ],
    //   )
    // );
  }
}
