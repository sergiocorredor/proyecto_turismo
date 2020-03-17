import 'package:flutter/material.dart';

import 'package:proyecto_turismo/Usuario.dart';
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
      Usuario usuario = new Usuario();
      usuario.esUsuario().then((valor) {
        if (valor) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaginaRecomendaciones()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaginaInicial()));
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
