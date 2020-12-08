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
    "http://Amirhoseinar.pythonanywhere.com/api/login",
    headers: <String, String>{'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );
}
