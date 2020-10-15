import 'package:flutter/cupertino.dart';
import 'package:tele_doctor/models/widgets/interfaces/json_handler.dart';
import 'package:tele_doctor/models/person/doctor/doctor.dart';
import 'package:tele_doctor/models/person/patient/widgets/insurance.dart';
import 'package:tele_doctor/models/person/person.dart';
import 'package:tele_doctor/models/widgets/visit.dart';

class Patient extends Person implements JsonHandler {
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

  set insurance(Insurance insurance) => this._insurance = insurance;
  Insurance get insurance => this._insurance;

  List<Visit> get visits => this._visits;
  List<Notification> get notifications => this._notifications;
  List<Doctor> get favoriteDoctros => this._favoriteDoctors;
  @override
  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "firstName": firstName,
      "lastName": lastName,
      "socialID": socialID,
      "age": age,
      "phoneNumber": phoneNumber,
      "email": email,
      "insurance": insurance,
      "visits": visits,
      "notifications": notifications,
      "favoriteDoctors": favoriteDoctros
    };
  }
}
