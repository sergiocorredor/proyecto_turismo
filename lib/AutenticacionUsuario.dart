import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:proyecto_turismo/paginas/paginaRecomendaciones.dart';

class AutenticacionUsuario {
  static Future<Map> esUsuario(BuildContext context) async {
    //Verificando si hay token almacenado localmente, asignándolo al token de la soliditud http si existe.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedToken = prefs.getString('token');
    String tokenInfo = storedToken == null ? '' : storedToken;

    String url = 'https://api-turismo-nodejs.herokuapp.com/api/usuario/perfil';
    var response = await http.get(url, headers: {'x-access-token': tokenInfo});
    print(response.statusCode);
    print('Autenticación');
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      Map datos = jsonDecode(response.body)['usuario'];
      return datos;
    } else {
      return {'nombre': 'noAutorizado'};
    }
  }

  static Future<String> ingresar(
      BuildContext context, String email, String password) async {
    String datosJson = json.encode({'email': email, 'contrasenha': password});
    String url =
        'https://api-turismo-nodejs.herokuapp.com/api/usuario/ingresar';
    var response = await http.post(url,
        headers: {'Content-type': 'application/json'}, body: datosJson);

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      //Obteniendo el token almacenado, si la respuesta a la solicitud es correcta.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', jsonDecode(response.body)['token']);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PaginaRecomendaciones()));
      return 'ok';
    } else {
      if (response.body.toString().contains('{')) {
        return 'password';
      } else {
        return 'email';
      }
    }
  }
}
