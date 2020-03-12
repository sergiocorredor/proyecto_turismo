import 'package:flutter/material.dart';

import 'package:proyecto_turismo/componentes/elementoScrollerLugares.dart';
import 'package:proyecto_turismo/paginas/paginaDetalles.dart';
import 'package:proyecto_turismo/paginas/paginaExplorar.dart';

class ScrollerLugares extends StatelessWidget {
  final String _titulo;
  final int _color;
  final List _listaLugares;
  final IconData _icono;

  ScrollerLugares(this._titulo, this._color, this._listaLugares, this._icono);

  void irADetalles(
      context, List _listaLugares, int index, int color, String _titulo) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return PaginaDetalles(_listaLugares, index, color, _titulo);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final double altura = MediaQuery.of(context).size.height;
    final double ancho = MediaQuery.of(context).size.width;

    return Column(children: <Widget>[
      Container(
        width: ancho,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white)),
            color: Colors.transparent),
        margin: EdgeInsets.only(top: 0),
        padding: EdgeInsets.only(
            left: altura * 0.0125, top: altura * 0.05, bottom: altura * 0.0125),
        child: Row(
          children: <Widget>[
            Icon(_icono, color: Colors.blue),
            Container(
              margin: EdgeInsets.only(left: ancho * 0.001),
              child: Text(
                _titulo,
                style: TextStyle(fontSize: altura * 0.032, color: Colors.blue),
                textAlign: TextAlign.left,
              ),
            ),
            Spacer(),
            FlatButton(
              child: Row(
                children: <Widget>[
                  Text('Ver más',
                      style: TextStyle(
                          color: Colors.blue, fontSize: altura * 0.025)),
                  Icon(Icons.arrow_forward_ios, color: Colors.blue)
                ],
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return PaginaExplorar(_color, _titulo, _listaLugares);
                }));
              },
              color: Colors.transparent,
            ),
          ],
        ),
      ),
      Container(
          margin: EdgeInsets.only(bottom: 0),
          padding: EdgeInsets.only(bottom: 0),
          height: altura * 0.38,
          /*decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.blue))),*/
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _listaLugares.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Hero(
                  tag: _listaLugares[index],
                  child: ElementoScrollerLugares(
                      _listaLugares[index]['name'],
                      _listaLugares[index]['image'][0],
                      _titulo == 'Hoteles'
                          ? _listaLugares[index]['precio']
                          : _listaLugares[index]['description'],
                      _color),
                ),
                onTap: () {
                  irADetalles(context, _listaLugares, index, _color, _titulo);
                },
              );
            },
          )),
    ]);
  }
}
