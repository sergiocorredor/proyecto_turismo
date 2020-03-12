import 'package:flutter/material.dart';

import 'package:proyecto_turismo/paginas/paginaIngreso.dart';
import 'package:proyecto_turismo/paginas/paginaRecomendaciones.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    final double altura = MediaQuery.of(context).size.height;
    final double ancho = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      height: altura,
      width: ancho,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        image: DecorationImage(
            image: AssetImage('./assets/images/Bucaramanga1.jpg'),
            fit: BoxFit.fitHeight),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: altura / 3,
            alignment: Alignment.center,
            child: Text('UEBAPP',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: altura * 0.08)),
          ),
          Container(
            height: altura / 3,
            width: ancho,
            alignment: Alignment.center,
            child: Text(
              'Descubre Lugares Maravillosos',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: altura * 0.035),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: altura * 0.02),
            height: altura / 3,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: ancho * 0.42,
                      margin: EdgeInsets.only(right: altura * 0.01),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white)),
                        color: Colors.transparent,
                        child: Text('Explorar',
                            style: TextStyle(
                                color: Colors.white, fontSize: altura * 0.028)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaginaRecomendaciones()));
                        },
                      ),
                    ),
                    Container(
                      width: ancho * 0.42,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white)),
                        color: Colors.transparent,
                        child: Text('Ingresar',
                            style: TextStyle(
                                color: Colors.white, fontSize: altura * 0.028)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaginaIngreso()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
