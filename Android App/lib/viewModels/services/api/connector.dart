import 'dart:convert';

import 'package:http/http.dart' as http;
import '';

Future<http.Response> register(Map<String, dynamic> body) async {
  return await http.post(
    "http://amirhoseinar.pythonanywhere.com/api/register/patient",
    headers: <String, String>{'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );
}

Future<http.Response> login(Map<String, dynamic> body) async {
  return await http.post(
    "http://amirhoseinar.pythonanywhere.com/api/login",
    headers: <String, String>{'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );
}

Future<http.Response> changePassword(
    String token, Map<String, dynamic> json) async {
  return await http.put(
    "http://amirhoseinar.pythonanywhere.com/api/change-password",
    headers: <String, String>{
      'Authorization': "Token $token",
      'Content-Type': 'application/json'
    },
    body: jsonEncode(json),
  );
}

Future<http.Response> editProfile(
    String token, Map<String, dynamic> json) async {
  return await http.put(
    "http://amirhoseinar.pythonanywhere.com/api/update/patient",
    headers: <String, String>{
      'Authorization': "Token $token",
      'Content-Type': 'application/json'
    },
    body: jsonEncode(json),
  );
}

Future<http.Response> search(
  String token,
  Map<String, dynamic> queryParameters,
) async {
  var uri = Uri.https('amirhoseinar.pythonanywhere.com',
      '/api/list/doctors', queryParameters);
  return await http.get(
    uri,
    headers: <String, String>{
      'Authorization': "Token $token",
      'Content-Type': 'application/json'
    },
  );
}
