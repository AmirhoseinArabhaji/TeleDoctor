import 'package:tele_doctor/models/person/patient/patient.dart';

class PatientInterface {
  Patient loadPatient() {}
  void savePatient(Patient patient) async {}
  bool isEmpty() {}
}
