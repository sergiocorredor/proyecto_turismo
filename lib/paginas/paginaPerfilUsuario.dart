import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:proyecto_turismo/componentes/navegadorPersonalizado.dart';
import 'package:proyecto_turismo/paginas/paginaRecomendaciones.dart';

class PaginaPerfilUsuario extends StatefulWidget {
  final Map _infoUsuario;

  PaginaPerfilUsuario(this._infoUsuario);

  @override
  _PaginaPerfilUsuarioState createState() => _PaginaPerfilUsuarioState();
}

class _PaginaPerfilUsuarioState extends State<PaginaPerfilUsuario> {
  void cerrarSesion(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', null);
    prefs.setBool('estaAutenticado', false);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PaginaRecomendaciones()));
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 35.0),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.width,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                    widget._infoUsuario['nombre'] +
                        ' ' +
                        widget._infoUsuario['apellido'],
                    style: TextStyle(color: Colors.black)),
                background: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('./assets/images/sinusuario.jpg'),
                            fit: BoxFit.cover))),
              );
            }),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 60,
                    child: Text(
                      'Información del perfil',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        cerrarSesion(context);
                      },
                      child: Text('Cerrar Sesión'),
                    ),
                  )
                ],
              );
            }, childCount: 1),
          )
        ],
      ),
      bottomNavigationBar: NavegadorPersonalizado(2),
    );
  }
}
