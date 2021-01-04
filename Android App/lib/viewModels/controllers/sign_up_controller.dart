import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/exceptions/connection_failed.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/services/api/connector.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/viewModels/services/api/responses/response.dart';
import 'package:tele_doctor/viewModels/services/api/user.dart';
import 'package:http/http.dart' as http;
import 'package:tele_doctor/viewModels/services/local/shared_prefence_controller.dart';

class SignUpController {
  TextEditingController email;
  TextEditingController password;
  EnterProperties ep;
  SPController sp;

  SignUpController() {
    email = TextEditingController();
    password = TextEditingController();
    ep = EnterProperties();
    sp = SPController();
  }

  _fillEnterProperties(String token) {
    this.ep.patient =
        Patient(email: email.text, password: password.text, token: token);
    this.ep.logout = false;
    this.ep.token = token;
  }

  Future<http.Response> sendToAPI() async {
    User user = User(email.text, password.text);
    http.Response response = await register(user.toJson());
    print(response.body);
    return response;
  }

  Future<PatientHandler> send(PatientHandler ph) async {
    http.Response response = await sendToAPI();
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = await jsonDecode(response.body);
      print(json["user"]);
      Response responseObject = Response.fromJson(json);
      _fillEnterProperties(responseObject.token);
      this.ep.patient.userID = int.parse(responseObject.userID);
      this.ep.patient.id = int.parse(responseObject.id);
      ph = PatientHandler(ep.patient);
      ep.logout = false;
      ep.firstAppearance = false;
      await sp.save(ep);
      return ph;
    } else
      throw ConnectionFailed();
  }
}
