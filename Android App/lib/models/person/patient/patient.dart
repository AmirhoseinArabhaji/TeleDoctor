import 'package:flutter/cupertino.dart';
import 'package:tele_doctor/models/widgets/notifications.dart';
import 'package:tele_doctor/models/person/doctor/doctor.dart';
import 'package:tele_doctor/models/person/patient/widgets/insurance.dart';
import 'package:tele_doctor/models/person/person.dart';
import 'package:tele_doctor/models/widgets/visit.dart';

class Patient extends Person {
  List<Visit> _visits;
  List<Notifications> _notifications;
  List<Doctor> _favoriteDoctors;
  Insurance _insurance;

  Patient(
    String firstName,
    String lastName,
    String phoneNumber,
    String socialID,
    String email,
    int age, {
    @required Insurance insurance,
  })  : this._insurance = insurance,
        super(firstName, lastName, phoneNumber, socialID, email, age) {
    this._favoriteDoctors = [];
    this._visits = [];
    this._notifications = [];
  }
}
