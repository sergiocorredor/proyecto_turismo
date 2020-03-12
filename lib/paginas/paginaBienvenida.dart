import 'package:flutter/material.dart';

import 'package:proyecto_turismo/AutenticacionUsuario.dart';
import 'package:proyecto_turismo/paginas/paginaInicial.dart';
import 'package:proyecto_turismo/paginas/paginaRecomendaciones.dart';
import 'package:proyecto_turismo/componentes/avisoCargando.dart';

class PaginaBienvenida extends StatefulWidget {
  @override
  _PaginaBienvenidaState createState() => _PaginaBienvenidaState();
}

class _PaginaBienvenidaState extends State<PaginaBienvenida> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AutenticacionUsuario.esUsuario(context).then((valor) {
        if (valor['nombre'] == 'noAutorizado') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaginaInicial()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaginaRecomendaciones()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AvisoCargando(),
    );
  }
}
