import 'package:flutter/material.dart';

class BotonFlotanteReserva extends StatelessWidget {
  final Function _redireccionar;
  final int _color;

  BotonFlotanteReserva(this._redireccionar, this._color);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: _redireccionar,
      label: Text('Obtén un guía', style: TextStyle(fontSize: 18)),
      backgroundColor: Color(_color),
    );
  }
}
