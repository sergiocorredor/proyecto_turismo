import 'package:flutter/material.dart';

class MenuOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        child: Icon(Icons.android),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Opción 1'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Opción 2'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pop(context);
        },
      )
    ]));
  }
}
