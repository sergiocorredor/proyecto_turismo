import 'package:flutter/material.dart';

import 'package:proyecto_turismo/paginas/paginaRecomendaciones.dart';
import 'package:proyecto_turismo/paginas/paginaIngreso.dart';
import 'package:proyecto_turismo/paginas/paginaPerfilUsuario.dart';
import 'package:proyecto_turismo/AutenticacionUsuario.dart';

class NavegadorPersonalizado extends StatelessWidget {
  final _indiceSeleccionado;

  NavegadorPersonalizado(this._indiceSeleccionado);
  //PREVENIR QUE UNA VEZ SELECCIONADO UNA OPCIÓN, ESTA MISMA SE PUEDA SELECCIONAR NUEVAMENTE.
  void onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaginaRecomendaciones()));
        }
        break;
      case 1:
        {}
        break;
      case 2:
        {
          AutenticacionUsuario.esUsuario(context).then((valor) {
            if (valor['nombre'] == 'noAutorizado') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaginaIngreso()));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaginaPerfilUsuario(valor)));
            }
          });
        }
        break;
      case 3:
        {}
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Para ti'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Buscar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Usuario'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Más'),
          ),
        ],
        currentIndex: _indiceSeleccionado,
        onTap: (_indiceSeleccionado) {
          onItemTapped(_indiceSeleccionado, context);
        });
  }
}
