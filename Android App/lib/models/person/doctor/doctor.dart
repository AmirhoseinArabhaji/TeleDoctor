import 'package:tele_doctor/models/person/doctor/widgets/calendar.dart';
import 'package:tele_doctor/models/person/doctor/widgets/status.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/models/person/person.dart';

class Doctor extends Person {
  Status _status;
  Calendar _calendar;
  List<Patient> _patients;
  double _patientsReview;
  String _address;
  String _university;
  String _currentHospital;
  Doctor(
    String token,
    String firstName,
    String lastName,
    String phoneNumber,
    String socialID,
    String email,
    int age, {
    String address,
    String university,
    String currentHospital,
    Status status,
  }) : super(token, firstName, lastName, phoneNumber, socialID, email, age);
}
