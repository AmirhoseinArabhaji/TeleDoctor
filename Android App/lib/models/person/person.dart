import 'package:flutter/cupertino.dart';
import 'package:tele_doctor/models/visit.dart';

abstract class Person {
  final String firstName, lastName;
  final String phoneNumber;
  final String email;
  final int age;
  final String socialID;
  List<Visit> _visits;
  Person({
    @required this.firstName,
    @required this.lastName,
    @required this.phoneNumber,
    @required this.email,
    @required this.age,
    @required this.socialID,
  }) {
    this._visits = [];
  }

  void addVisit(Visit visit) => this._visits.add(visit);
  void clearVisits() => this._visits.clear();
}
