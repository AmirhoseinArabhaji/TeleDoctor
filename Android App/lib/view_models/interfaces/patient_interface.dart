import 'package:tele_doctor/models/person/patient/patient.dart';

class PatientInterface {
  Patient loadPatient() {}
  void savePatient() async {}
  bool isEmpty() {}
  Patient get patient {}
  set patient(Patient patient) {}
}
