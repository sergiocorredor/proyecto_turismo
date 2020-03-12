import 'package:flutter/material.dart';

import 'package:proyecto_turismo/componentes/scrollerLugares.dart';
import 'package:proyecto_turismo/informacion.dart';
import 'package:proyecto_turismo/componentes/navegadorPersonalizado.dart';

class PaginaRecomendaciones extends StatefulWidget {
  @override
  _PaginaRecomendacionesState createState() => _PaginaRecomendacionesState();
}

class _PaginaRecomendacionesState extends State<PaginaRecomendaciones> {
  bool _enBusqueda = false;
  final controller = ScrollController();

  void estaEnBusqueda() {
    setState(() {
      this._enBusqueda = true;
    });
  }

  void noEstaEnBusqueda() {
    setState(() {
      this._enBusqueda = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _enBusqueda == false
      //     ? AppBar(
      //         leading: Builder(
      //           builder: (BuildContext context) {
      //             return IconButton(
      //               icon: const Icon(Icons.menu),
      //               onPressed: () {
      //                 Scaffold.of(context).openDrawer();
      //               },
      //               tooltip:
      //                   MaterialLocalizations.of(context).openAppDrawerTooltip,
      //             );
      //           },
      //         ),
      //         title: Text('BUCARAMANGA CITY APP'),
      //         actions: <Widget>[
      //           IconButton(
      //             icon: Icon(Icons.search),
      //             tooltip: 'Búsqueda',
      //             onPressed: estaEnBusqueda,
      //           ),
      //         ],
      //       )
      //     : AppBar(
      //         shape:
      //             RoundedRectangleBorder(side: BorderSide(color: Colors.blue)),
      //         backgroundColor: Colors.white,
      //         leading: IconButton(
      //             icon: Icon(Icons.close),
      //             onPressed: noEstaEnBusqueda,
      //             color: Colors.blue),
      //         title: TextFormField(
      //           style: TextStyle(fontSize: 18),
      //           autofocus: true,
      //         ),
      //       ),
      body: Theme(
        data: ThemeData(highlightColor: Colors.blue),
        child: Scrollbar(
          child: ListView(controller: controller, children: <Widget>[
            ScrollerLugares('¿Qué conocer?', 0xFFF57C00, places, Icons.place),
            ScrollerLugares(
                'Actividades', 0xFF388E3C, activities, Icons.directions_run),
            ScrollerLugares('Hoteles', 0xFFE91E63, hotels, Icons.hotel),
            ScrollerLugares(
                'Restaurantes', 0xFF9C27B0, restaurants, Icons.restaurant),
          ]),
        ),
      ),
      bottomNavigationBar: NavegadorPersonalizado(0),
    );
  }
}
