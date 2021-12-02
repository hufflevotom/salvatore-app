import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService extends ChangeNotifier {
  final String _baseUrl = 'salvatore-backend.herokuapp.com';

  Future<String?> login(String docIdentidad, String password) async {
    final Map<String, dynamic> bodyData = {
      'dni': docIdentidad,
      'contrasena': password
    };
    final url = Uri.https(_baseUrl, '/v1/usuario/sesion');
    final resp = await http.post(url, body: bodyData);
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    if (decodeResp['type'] == 'success') {
      if (decodeResp['data']['idTipoRol'] == '60bb0fad68bcb70590c9eccd') {
        return null;
      } else {
        return 'No es repartidor';
      }
    } else {
      return decodeResp['message'];
    }
  }
}
