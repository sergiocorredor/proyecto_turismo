import 'package:flutter/material.dart';

import 'package:proyecto_turismo/paginas/paginaBienvenida.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bucaramanga APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaBienvenida(),
    );
  }
}
