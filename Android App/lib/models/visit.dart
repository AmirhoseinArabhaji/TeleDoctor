import 'package:flutter/cupertino.dart';
import 'package:tele_doctor/models/person/doctor/doctor.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';

class Visit {
  final Patient patient;
  final Doctor doctor;
  final DateTime date;

  const Visit({
    @required this.patient,
    @required this.doctor,
    @required this.date,
  });
}
