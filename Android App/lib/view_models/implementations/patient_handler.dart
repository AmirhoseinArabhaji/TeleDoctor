import 'dart:io';
import 'dart:convert' as JSON;
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/view_models/interfaces/patient_interface.dart';
import 'package:path_provider/path_provider.dart';

class PatientHandler implements PatientInterface {
  Patient _patient;

  PatientHandler({Patient patient}) : this._patient = patient;

  Patient get patient => _patient;
  set patient(Patient patient) => this._patient = patient;

  @override
  bool isEmpty() {}

  @override
  Patient loadPatient() {}

  @override
  void savePatient(Patient patient) async {
    final file = await _localFile;
    file.writeAsString(_makeJSON);
    print(_makeJSON);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/patient.json');
  }

  String get _makeJSON => JSON.jsonEncode(this.patient.toJson());
}
