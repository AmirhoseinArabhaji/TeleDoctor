import 'package:flutter/material.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/services/api/connector.dart';
import 'package:tele_doctor/viewModels/services/api/user.dart';
import 'package:http/http.dart' as http;

class SignUpController {
  TextEditingController email;
  TextEditingController password;
  EnterProperties ep;

  SignUpController() {
    email = TextEditingController();
    password = TextEditingController();
    ep = EnterProperties();
  }

  fillEnterProperties(String token){
    this.ep.patient = Patient(email: email.text, password: password.text, token: token);
    this.ep.logout = false;
    this.ep.token = token;
    print(token);
  }

  Future<http.Response> sendToAPI() async {
    User user = User(email.text, password.text);
    http.Response response =
        await register(user.toJson());
    return response;

  }
}
