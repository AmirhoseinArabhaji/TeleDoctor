import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/exceptions/connection_failed.dart';
import 'package:tele_doctor/models/exceptions/user_not_found_exception.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/services/api/connector.dart' as API;
import 'package:tele_doctor/viewModels/services/api/responses/response_login.dart';
import 'package:tele_doctor/viewModels/services/local/shared_prefence_controller.dart';
import 'package:http/http.dart' as http;

class SignInController {
  TextEditingController _email;
  TextEditingController _password;
  EnterProperties _ep;
  SPController _spController;

  SignInController() {
    _email = TextEditingController();
    _password = TextEditingController();
    _ep = EnterProperties();
    _spController = SPController();
    _fetchData();
  }

  //Methods
  _fetchData() async {
    _ep = await _spController.fetch(_ep);
  }

  Future<http.Response> _sendToApi() async {
    String email = _email.text;
    String password = _password.text;
    Map<String, dynamic> _body = {
      "username": email,
      "password": password,
    };
    http.Response response = await API.login(_body);
    return response;
  }

  Future<PatientHandler> send(PatientHandler _patientHandler) async {
    http.Response response = await _sendToApi();
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      LoginResponse loginResponse = await jsonDecode(response.body);
      if (_ep.token == loginResponse.token) {
        loginResponse.password = password.text;
        _ep.patient = Patient.fromLoginResponse(loginResponse);
        _patientHandler = PatientHandler(_ep.patient);
        return _patientHandler;
      } else
        throw UserNotFound();
    } else
      throw ConnectionFailed();
  }

  //Setters and Getters
  TextEditingController get email => _email;

  set email(TextEditingController value) {
    _email = value;
  }

  TextEditingController get password => _password;

  set password(TextEditingController value) {
    _password = value;
  }
}
