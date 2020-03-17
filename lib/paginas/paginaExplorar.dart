import 'package:flutter/material.dart';

import 'package:proyecto_turismo/paginas/paginaDetalles.dart';
import 'package:proyecto_turismo/componentes/ratingEstrellas.dart';

class PaginaExplorar extends StatefulWidget {
  final int _color;
  final String _titulo;
  final List _listaLugares;

  PaginaExplorar(this._color, this._titulo, this._listaLugares);

  @override
  _PaginaExplorarState createState() => _PaginaExplorarState();
}

class _PaginaExplorarState extends State<PaginaExplorar> {
  void iraDetalles(
      context, List _listaLugares, int index, int color, String _titulo) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return PaginaDetalles(_listaLugares, index, color, _titulo);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final double altura = MediaQuery.of(context).size.height;
    final double ancho = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(widget._color),
            title: Container(
                child: Text(widget._titulo,
                    style: TextStyle(fontSize: altura * 0.029)))),
        body: Theme(
          data: ThemeData(highlightColor: Color(widget._color)),
          child: Scrollbar(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    child: Text(
                  'Prueba',
                  textAlign: TextAlign.center,
                )),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget._listaLugares.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Cambiar por expandedtile
                      return GestureDetector(
                        onTap: () {
                          iraDetalles(context, widget._listaLugares, index,
                              widget._color, widget._titulo);
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: altura * 0.018),
                            width: ancho,
                            height: ancho / 3,
                            child: Row(
                              children: <Widget>[
                                Container(
                                    width: ancho / 3,
                                    height: ancho / 3,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: ancho * 0.005,
                                            color: Color(widget._color)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                widget._listaLugares[index]
                                                    ['image'][0]),
                                            fit: BoxFit.cover))),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width:
                                          ancho - (ancho / 3) - (ancho * 0.023),
                                      margin: EdgeInsets.all(ancho * 0.011),
                                      child: Text(
                                          widget._listaLugares[index]['name'],
                                          softWrap: true,
                                          style: TextStyle(
                                              color: Color(widget._color),
                                              fontWeight: FontWeight.bold,
                                              fontSize: altura * 0.024)),
                                    ),
                                    Container(
                                        width: ancho - (ancho / 3),
                                        alignment: Alignment.centerLeft,
                                        child: RatingEstrellas(
                                            altura * 0.024,
                                            false,
                                            false,
                                            widget._listaLugares[index]
                                                ['calificacion'])),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                (ancho / 3) -
                                                (ancho * 0.023),
                                        height: (ancho / 3) - (ancho * 0.208),
                                        margin: EdgeInsets.all(ancho * 0.011),
                                        child: Text(
                                          widget._listaLugares[index]
                                              ['description'],
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: altura * 0.019),
                                          overflow: TextOverflow.fade,
                                        )),
                                  ],
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
