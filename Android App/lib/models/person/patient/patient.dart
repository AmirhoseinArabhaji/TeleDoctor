import 'package:flutter/cupertino.dart';
import 'package:tele_doctor/models/person/doctor/doctor.dart';
import 'package:tele_doctor/models/person/patient/widgets/insurance.dart';
import 'package:tele_doctor/models/person/person.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/models/person/widgets/visit.dart';
import 'package:tele_doctor/viewModels/services/api/responses/response_login.dart';

class Patient extends Person {
  List<Visit> _visits;
  List<Notification> _notifications;
  List<Doctor> _favoriteDoctors;
  Insurance _insurance;
  int _id;
  int _userID;

  Patient({
    String token = "none",
    @required String email,
    @required String password,
  }) : super(token, email, password) {
    this._favoriteDoctors = [];
    this._visits = [];
    this._notifications = [];
    this._insurance = Insurance();
    _id = 0;
    userID = 0;
  }

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  factory Patient.fromLoginResponse(LoginResponse loginResponse) =>
      _$PatientFromLoginResponse(loginResponse);

  set insurance(Insurance insurance) => this._insurance = insurance;

  Insurance get insurance => this._insurance;

  List<Visit> get visits => this._visits;

  List<Notification> get notifications => this._notifications;

  List<Doctor> get favoriteDoctros => this._favoriteDoctors;

  Map<String, dynamic> toJson() => _$PatientToJson(this);

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int get userID => _userID;

  set userID(int value) {
    _userID = value;
  }
}

Map<String, dynamic> _$PatientToJson(Patient patient) {
  return {
    "token": patient.token,
    "firstName": patient.firstName,
    "lastName": patient.lastName,
    "socialID": patient.socialID,
    "password": patient.password,
    "age": patient.age,
    "phoneNumber": patient.phoneNumber,
    "email": patient.email,
    "insurance": patient.insurance.toJson(),
    "visits": patient.visits,
    "notifications": patient.notifications,
    "favoriteDoctors": patient.favoriteDoctros,
    "userID": patient.userID,
    "id": patient.id,
  };
}

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return Patient(
    token: json["token"],
    email: json["email"],
    password: json["password"],
  );
}

Patient _$PatientFromLoginResponse(LoginResponse loginResponse) {
  Patient patient = Patient(
      token: loginResponse.token,
      email: loginResponse.email,
      password: loginResponse.password);
  patient.gender = loginResponse.gender;
  patient.socialID = loginResponse.socialID;
  patient.phoneNumber = loginResponse.phoneNumber;
  patient.birthDay = loginResponse.birthDate;
  patient.lastName = loginResponse.lastName;
  patient.firstName = loginResponse.firstName;
  patient.password = loginResponse.password;
  //These Two lines are Suspicious!!!!, MAYBE SHOULD SWAP THEM
  patient.id = loginResponse.id;
  patient.userID = loginResponse.patientID;
}
