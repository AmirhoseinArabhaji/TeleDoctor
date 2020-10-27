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

  //Todo complete this function
  ///return true if file is empty
  @override
  bool isEmpty() {}

  //Todo complete this function
  ///load patient object from Json file
  @override
  Patient loadPatient() {}

  ///write patient in Json format into file
  @override
  void savePatient() async {
    final file = await _localFile;
    file.writeAsString(_makeJSON);
  }

  ///get application documents directory and return it
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  ///take localPath and make a file and returns it by new path
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/patient.json');
  }

  ///encode patient's json
  String get _makeJSON => JSON.jsonEncode(this.patient.toJson());
}
