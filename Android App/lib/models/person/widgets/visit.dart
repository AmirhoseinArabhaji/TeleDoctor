import 'package:tele_doctor/models/person/doctor/doctor.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';

class Visit {
  Doctor _doctor;
  Patient _patient;
  DateTime _startTime;

  Visit(Doctor doctor, Patient patient, DateTime startTime)
      : this._doctor = doctor,
        this._patient = patient,
        this._startTime = startTime;
}
