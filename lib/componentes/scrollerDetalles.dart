import 'package:flutter/material.dart';

class ScrollerDetalles extends StatelessWidget {
  final List _imagenes;
  final int _color;
  final Function _cambiarImagen;

  ScrollerDetalles(this._imagenes, this._color, this._cambiarImagen);

  @override
  Widget build(BuildContext context) {
    final double ancho = MediaQuery.of(context).size.width;

    return Container(
      height: ancho * 0.231,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imagenes.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
                width: ancho * 0.231,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(_color), width: ancho * 0.002),
                    image: DecorationImage(
                        image: AssetImage(_imagenes[index]),
                        fit: BoxFit.cover))),
            onTap: () {
              this._cambiarImagen(index);
            },
          );
        },
      ),
    );
  }
}
