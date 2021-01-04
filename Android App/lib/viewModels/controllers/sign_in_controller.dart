import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/exceptions/connection_failed.dart';
import 'package:tele_doctor/models/exceptions/email_validation_exception.dart';
import 'package:tele_doctor/models/exceptions/password_validation_exception.dart';
import 'package:tele_doctor/models/exceptions/user_not_found_exception.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/models/widgets/email_checker.dart';
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
  }

  /// @return true if email is validate
  bool _emailValidation() {
    EmailChecker checker = EmailChecker(rawEmail: _email.text);
    return checker.isValid;
  }

  bool _checkFields() {
    ///Length must be bigger than 8
    bool passwordValidationValue = password.text.length >= 8;
    if (!passwordValidationValue) throw PasswordValidationException();
    bool emailValidationValue = _emailValidation();
    if (!emailValidationValue) throw EmailValidationException();
    return passwordValidationValue && emailValidationValue;
  }

  Future<http.Response> _sendToAPI() async {
    String email = _email.text;
    String password = _password.text;
    try {
      _checkFields();
    } on PasswordValidationException catch (_) {
      throw PasswordValidationException();
    } on EmailValidationException catch (_) {
      throw EmailValidationException();
    }
    Map<String, dynamic> jsonPocket = {
      "username": email,
      "password": password,
    };
    return await API.login(jsonPocket);
  }

  Future<PatientHandler> login(PatientHandler ph) async{
    http.Response response;
    try {
      response = await _sendToAPI();
    } on PasswordValidationException catch (_) {
      throw PasswordValidationException();
    } on EmailValidationException catch (_) {
      throw EmailValidationException();
    }
    print(response.statusCode);
    print(response.body);
    return ph;
  }


  //Methods
  _fetchData() async {
    _ep = await _spController.fetch(_ep);
  }

  Future<PatientHandler> getPH() async {
    await _fetchData();
    return PatientHandler(_ep.patient);
  }

  bool firstAppearance() => _ep.firstAppearance;

  // Future<http.Response> _sendToApi() async {
  //   String email = _email.text;
  //   String password = _password.text;
  //   Map<String, dynamic> _body = {
  //     "username": email,
  //     "password": password,
  //   };
  //   http.Response response = await API.login(_body);
  //   return response;
  // }
  //
  // Future<PatientHandler> send(PatientHandler _patientHandler) async {
  //   http.Response response = await _sendToApi();
  //   print(response.body);
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     LoginResponse loginResponse = await jsonDecode(response.body);
  //     if (_ep.token == loginResponse.token) {
  //       loginResponse.password = password.text;
  //       _ep.patient = Patient.fromLoginResponse(loginResponse);
  //       _patientHandler = PatientHandler(_ep.patient);
  //       return _patientHandler;
  //     } else
  //       throw UserNotFound();
  //   } else
  //     throw ConnectionFailed();
  // }

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
