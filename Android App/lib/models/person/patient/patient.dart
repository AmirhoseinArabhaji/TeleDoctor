import 'package:flutter/cupertino.dart';
import 'package:tele_doctor/models/person/doctor/doctor.dart';
import 'package:tele_doctor/models/person/patient/widgets/insurance.dart';
import 'package:tele_doctor/models/person/person.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/models/person/widgets/visit.dart';

class Patient extends Person {
  List<Visit> _visits;
  List<Notification> _notifications;
  List<Doctor> _favoriteDoctors;
  Insurance _insurance;

  Patient(
    String token, {
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
  }) : super(token, firstName, lastName, email, password) {
    this._favoriteDoctors = [];
    this._visits = [];
    this._notifications = [];
  }

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);


  set insurance(Insurance insurance) => this._insurance = insurance;

  Insurance get insurance => this._insurance;

  List<Visit> get visits => this._visits;

  List<Notification> get notifications => this._notifications;

  List<Doctor> get favoriteDoctros => this._favoriteDoctors;

  Map<String, dynamic> toJson() => _$PatientToJson(this);

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Map<String, dynamic> _$PatientToJson(Patient patient) {
  return {
    "token": patient.token,
    "firstName": patient.firstName,
    "lastName": patient.lastName,
    "socialID": patient.socialID,
    "password" : patient.password,
    "age": patient.age,
    "phoneNumber": patient.phoneNumber,
    "email": patient.email,
    "insurance": patient.insurance,
    "visits": patient.visits,
    "notifications": patient.notifications,
    "favoriteDoctors": patient.favoriteDoctros
  };
}


Patient _$PatientFromJson(Map<String, dynamic> json) {
  return Patient(
    json["token"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
  );
}