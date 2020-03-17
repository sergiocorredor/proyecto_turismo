import 'package:flutter/material.dart';

class RatingEstrellas extends StatefulWidget {
  final double _tamano;
  final bool _esActiva;
  final bool _esCalificada;
  final double _calificacion;

  RatingEstrellas(
      this._tamano, this._esActiva, this._esCalificada, this._calificacion);

  @override
  _RatingEstrellasState createState() => _RatingEstrellasState();
}

class _RatingEstrellasState extends State<RatingEstrellas> {
  double calificacion;
  bool esCalificada;

  @override
  void initState() {
    super.initState();
    calificacion = widget._calificacion;
    esCalificada = widget._esCalificada;
  }

  void califUsuario(int index) {
    setState(() {
      calificacion = index.toDouble() + 1;
      esCalificada = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget._tamano * 5.5,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (int index) {
            return GestureDetector(
              child: Icon(
                index + 1 < calificacion
                    ? Icons.star
                    : index + 1 > calificacion.ceil()
                        ? Icons.star_border
                        : index + 1 == calificacion
                            ? Icons.star
                            : Icons.star_half,
                color: esCalificada ? Colors.blue : Colors.yellow,
                size: widget._tamano,
              ),
              onTap: () {
                if (widget._esActiva) {
                  califUsuario(index);
                }
              },
            );
          })),
    );
  }
}
