import 'package:flutter/material.dart';

import 'package:proyecto_turismo/Usuario.dart';
import 'package:proyecto_turismo/paginas/paginaRegistro.dart';
import 'package:proyecto_turismo/paginas/paginaRecomendaciones.dart';

class PaginaIngreso extends StatefulWidget {
  @override
  _PaginaIngresoState createState() => _PaginaIngresoState();
}

class _PaginaIngresoState extends State<PaginaIngreso> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _campoInvalido;

  @override
  void dispose() {
    this._emailController.dispose();
    this._passwordController.dispose();
    super.dispose();
  }

  void setCampoInvalido(String campoInvalido) {
    setState(() {
      this._campoInvalido = campoInvalido;
    });
  }

  void _ingresarUsuario(BuildContext context) {
    Usuario usuario = new Usuario(
        email: _emailController.text, contrasenha: _passwordController.text);
    usuario.ingresarUsuario().then((valor) {
      if (valor == 'ok') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PaginaRecomendaciones()));
      } else {
        setCampoInvalido(valor);
        _formKey.currentState.validate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: 350.0,
              height: 340.0,
              child: Column(
                children: <Widget>[
                  Text('Ingresar',
                      style: TextStyle(fontSize: 24, color: Colors.blue)),
                  Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                    controller: _emailController,
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return 'Campo requerido.';
                      } else if (!valor.contains('@')) {
                        //MEJORAR
                        return 'Se requiere un correo válido';
                      } else if (_campoInvalido == 'email') {
                        return 'No existe el usuario';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 4.0),
                        labelText: 'Email',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  Spacer(),
                  TextFormField(
                    controller: _passwordController,
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return 'Campo requerido.';
                      } else if (_campoInvalido == 'password') {
                        return 'La contraseña es incorrecta';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 4.0),
                        labelText: 'Contraseña',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  Spacer(),
                  RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    color: Colors.blue,
                    onPressed: () {
                      _ingresarUsuario(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Ingresar',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0)),
                      ],
                    ),
                  ),
                  Spacer(),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue)),
                    padding: EdgeInsets.all(15.0),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaginaRegistro()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Crear una cuenta',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 18.0)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('¿Olvidaste la contraseña?',
                          style: TextStyle(fontSize: 16.0)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
