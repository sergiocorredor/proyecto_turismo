import 'package:flutter/material.dart';

class ElementoScrollerLugares extends StatelessWidget {
  final String _tipoOpcion;
  final String _imagen;
  final String _descripcion;
  final int _color;

  ElementoScrollerLugares(
      this._tipoOpcion, this._imagen, this._descripcion, this._color);

  @override
  Widget build(BuildContext context) {
    final double altura = MediaQuery.of(context).size.height;
    final double ancho = MediaQuery.of(context).size.width;

    return Container(
      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Container(
            padding: EdgeInsets.all(ancho * 0.005),
            child: Text(_tipoOpcion,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(fontSize: altura * 0.028, color: Colors.blue))),
        Container(
          constraints: BoxConstraints(maxHeight: altura * 0.24),
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(_imagen), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: altura * 0.068,
          padding: EdgeInsets.all(ancho * 0.005),
          child: Align(
            alignment: Alignment.center,
            child: Text(_descripcion,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.blue, fontSize: altura * 0.022)),
          ),
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(color: Colors.blue),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
            ),
          ),
        ),
      ]),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        /*border: Border.all(color: Colors.blue),*/ color: Colors.white,
        /*borderRadius: BorderRadius.all(Radius.circular(10.0))*/
      ),
      margin: EdgeInsets.only(left: ancho * 0.01, right: ancho * 0.01),
      width: ancho *  0.46,
    );
  }
}
