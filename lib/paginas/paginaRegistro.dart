import 'package:flutter/material.dart';

import 'package:proyecto_turismo/Usuario.dart';
import 'package:proyecto_turismo/paginas/paginaIngreso.dart';
import 'package:proyecto_turismo/paginas/paginaRecomendaciones.dart';

class PaginaRegistro extends StatefulWidget {
  @override
  _PaginaRegistroState createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _emailController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  String _campoInvalido;
  @override
  void dispose() {
    this._nombreController.dispose();
    this._apellidoController.dispose();
    this._emailController.dispose();
    this._password1Controller.dispose();
    this._password2Controller.dispose();
    super.dispose();
  }

  void setCampoInvalido(String campoInvalido) {
    setState(() {
      this._campoInvalido = campoInvalido;
    });
  }

  //Funciona. Aunque siempre retorna error al registrar. Revisar api, base de datos, código.
  void _registrarUsuario(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Usuario usuario = new Usuario(
        nombre: _nombreController.text,
        apellido: _apellidoController.text,
        email: _emailController.text,
        contrasenha: _password1Controller.text,
        confirmarContrasenha: _password2Controller.text,
      );
      usuario.registrarUsuario().then((valor) {
        if (valor == 'ok') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PaginaRecomendaciones()));
        } else if (valor.contains('ya existe')) {
          setCampoInvalido('email');
          _formKey.currentState.validate();
        }
      });
    }
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
              height: 560.0,
              child: Column(
                children: <Widget>[
                  Text('Crea una cuenta',
                      style: TextStyle(fontSize: 24.0, color: Colors.blue)),
                  Padding(padding: EdgeInsets.all(10.0)),
                  TextFormField(
                    controller: _nombreController,
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return 'Campo requerido.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 4.0),
                        labelText: 'Nombre',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  Spacer(),
                  TextFormField(
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return 'Campo requerido.';
                      }
                      return null;
                    },
                    controller: _apellidoController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 4.0),
                        labelText: 'Apellido',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  Spacer(),
                  TextFormField(
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return 'Campo requerido.';
                      } else if (!valor.contains('@')) {
                        return 'Se requiere un correo válido'; //MEJORAR
                      } else if (_campoInvalido == 'email') {
                        return 'El usuario ya existe';
                      }
                      return null;
                    },
                    controller: _emailController,
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
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return 'Campo requerido.';
                      } else if (valor.length < 4) {
                        return 'La contraseña debe contener 4 caracteres.';
                      }
                      return null;
                    },
                    controller: _password1Controller,
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
                  TextFormField(
                    validator: (valor) {
                      if (valor.isEmpty) {
                        return 'Campo requerido.';
                      } else if (_password1Controller.text !=
                          _password2Controller.text) {
                        return 'Las contraseñas deben coincidir.';
                      }
                      return null;
                    },
                    controller: _password2Controller,
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 4.0),
                        labelText: 'Confirmar Contraseña',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                  Spacer(),
                  RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    color: Colors.blue,
                    onPressed: () {
                      _registrarUsuario(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Registrarme',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Text(
                      'Al presionar Registrarme estás aceptando los Términos de Servicio y las Políticas de Privacidad.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue)),
                    padding: EdgeInsets.all(15.0),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaginaIngreso()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Ya tengo una cuenta',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 18.0)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
