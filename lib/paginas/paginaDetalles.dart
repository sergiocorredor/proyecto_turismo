import 'package:flutter/material.dart';

import 'package:proyecto_turismo/componentes/scrollerDetalles.dart';
import 'package:proyecto_turismo/paginas/paginaIngreso.dart';
import 'package:proyecto_turismo/componentes/mapaUbicacion.dart';
import 'package:proyecto_turismo/componentes/ratingEstrellas.dart';

class PaginaDetalles extends StatefulWidget {
  final List _listaLugares;
  final int _indice;
  final int _color;
  final String _titulo;

  PaginaDetalles(this._listaLugares, this._indice, this._color, this._titulo);

  @override
  _PaginaDetallesState createState() => _PaginaDetallesState();
}

class _PaginaDetallesState extends State<PaginaDetalles> {
  double _alturaExpandido;
  final ScrollController _scrollController = ScrollController();
  int _indiceImagen = 0;

  void setIndiceImagen(int indiceImagen) {
    setState(() {
      this._indiceImagen = indiceImagen;
    });
  }

  void iraIngreso(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PaginaIngreso()));
  }

  bool get _mostrarTitulo {
    return _scrollController.hasClients &&
        _scrollController.offset > _alturaExpandido - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    final double altura = MediaQuery.of(context).size.height;
    final double ancho = MediaQuery.of(context).size.width;
    _alturaExpandido = ancho;

    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color(widget._color),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Colors.white, size: altura * 0.042),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          pinned: true,
          floating: true,
          expandedHeight: _alturaExpandido,
          flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return FlexibleSpaceBar(
              centerTitle: true,
              title: _mostrarTitulo
                  ? Text(widget._listaLugares[widget._indice]['name'],
                      style: TextStyle(
                          color: Colors.white, fontSize: altura * 0.029))
                  : null,
              background: Hero(
                  tag: widget._listaLugares[widget._indice],
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  widget._listaLugares[widget._indice]['image']
                                      [_indiceImagen]),
                              fit: BoxFit.cover)))),
            );
          }),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              padding: EdgeInsets.all(ancho * 0.011),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(widget._color),
                  border: Border.all(color: Color(widget._color))),
              child: _mostrarTitulo
                  ? Text("", style: TextStyle(color: Color(widget._color)))
                  : Text(widget._listaLugares[widget._indice]['name'],
                      style: TextStyle(
                          color: Colors.white, fontSize: altura * 0.029),
                      textAlign: TextAlign.center)),
          Container(
              margin: EdgeInsets.only(bottom: altura * 0.018),
              child: ScrollerDetalles(
                  widget._listaLugares[widget._indice]['image'],
                  this.widget._color,
                  setIndiceImagen)),
          Container(
              padding: EdgeInsets.all(altura * 0.018),
              width: ancho,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: altura * 0.048,
                  ),
                  Column(children: <Widget>[
                    Text(
                        '${widget._listaLugares[widget._indice]['calificacion']}',
                        style: TextStyle(fontSize: altura * 0.032)),
                    Text(
                        '${widget._listaLugares[widget._indice]['numeroVotos']} votos',
                        style: TextStyle(fontSize: altura * 0.016)),
                  ]),
                  RatingEstrellas(altura * 0.048, true, true, 0.0),
                ],
              )),
          Container(
            padding: EdgeInsets.all(altura * 0.018),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Descripción',
                    style: TextStyle(
                        fontSize: altura * 0.027,
                        color: Color(widget._color),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: altura * 0.019),
                ),
                Text(
                  widget._listaLugares[widget._indice]['description'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: altura * 0.024),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(altura * 0.018),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '¿Cómo llegar?',
                    style: TextStyle(
                        fontSize: altura * 0.027,
                        color: Color(widget._color),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: altura * 0.019),
                ),
                Container(
                  width: ancho,
                  height: ancho,
                  child: MapaUbicacion(
                      widget._listaLugares[widget._indice]['name'],
                      widget._listaLugares[widget._indice]['coordenadas'][0],
                      widget._listaLugares[widget._indice]['coordenadas'][1]),
                ),
              ],
            ),
          ),
        ])),
      ]),
      // floatingActionButton: FloatingActionButton.extended(
      //     label: this.widget._titulo == '¿Qué conocer?' ||
      //             this.widget._titulo == 'Actividades'
      //         ? Text(
      //             'Obtén un guía',
      //             style: TextStyle(fontSize: altura * 0.022),
      //             textAlign: TextAlign.center,
      //           )
      //         : Text(
      //             'Reservación',
      //             style: TextStyle(fontSize: altura * 0.022),
      //             textAlign: TextAlign.center,
      //           ),
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => PaginaIngreso()));
      //     },
      //     elevation: 0.0,
      //     backgroundColor: Color(widget._color)),
    );
  }
}
