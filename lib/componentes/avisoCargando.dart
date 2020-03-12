import 'package:flutter/material.dart';

class AvisoCargando extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text('Cargando...', style: TextStyle(fontSize: 20)),
    );
  }
}
