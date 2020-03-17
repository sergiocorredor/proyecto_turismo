import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Usuario {
  String nombre;
  String apellido;
  String email;
  String celular;
  String contrasenha;
  String confirmarContrasenha;
  String fechaNacimiento;
  String sexo;

  Usuario(
      {this.nombre,
      this.apellido,
      this.email,
      this.celular,
      this.contrasenha,
      this.confirmarContrasenha,
      this.fechaNacimiento,
      this.sexo});

  Future<String> registrarUsuario() async {
    String datosJson = json.encode({
      'nombre': this.nombre,
      'apellido': this.apellido,
      'email': this.email,
      'celular': '', //Campos en la api, no en el formulario
      'contrasenha': this.contrasenha,
      'confirmarContrasenha': this.confirmarContrasenha,
      'fechaNacimiento': '2000-01-01',
      'sexo': ''
    });
    String url =
        'https://api-turismo-nodejs.herokuapp.com/api/usuario/registrar';
    var response = await http.post(url,
        headers: {'Content-type': 'application/json'}, body: datosJson);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      //Obteniendo el token almacenado, si la respuesta a la solicitud es correcta.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', jsonDecode(response.body)['token']);
      prefs.setBool('estaAutenticado', true);
      return 'ok';
    } else {
      return jsonDecode(response.body).toString();
    }
  }

  Future<String> ingresarUsuario() async {
    String datosJson =
        json.encode({'email': this.email, 'contrasenha': this.contrasenha});
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
      prefs.setBool('estaAutenticado', true);
      return 'ok';
    } else {
      if (response.body.toString().contains('{')) {
        return 'password';
      } else {
        return 'email';
      }
    }
  }

  Future<Map> datosUsuario() async {
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

  Future<bool> esUsuario() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool estaAutenticado = prefs.getBool('estaAutenticado');
    if (estaAutenticado == null) {
      return false;
    }
    return estaAutenticado;
  }
}
