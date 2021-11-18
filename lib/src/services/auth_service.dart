import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyD7v-_HLq0OuzKJU9Z7pLGoE-nOHwphs3M';

  Future<String?> createUsuario(String email, String password) async {
    final Map<String, String> authData = {'email': email, 'password': password};

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      // Guardar el token
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }
}
