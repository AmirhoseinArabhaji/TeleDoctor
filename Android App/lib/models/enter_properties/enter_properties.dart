import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class EnterProperties {
  Patient _patient;
  bool _logout;

  factory EnterProperties.fromJson(Map<String, dynamic> json) =>
      _$EPFromJson(json);

  Map<String, dynamic> toJson() =>_$EPToJson(this);

  EnterProperties({bool logout = false, Patient patient})
      : this._patient = patient,
        this._logout = logout;

  set patient(Patient patient) => this._patient = patient;

  set logout(bool logout) => this._logout = logout;

  Patient get patient => this._patient;

  bool get logout => this._logout;

  @override
  void fromJson(Map<String, dynamic> json) {
    this._patient = json['patient'];
    this._logout = json['logout'];
  }
}

EnterProperties _$EPFromJson(Map<String, dynamic> json) {
  return EnterProperties(
    patient: Patient.fromJson(json['patient']),
    logout: json['logout'] as bool,
  );
}

Map<String, dynamic> _$EPToJson(EnterProperties enterProperties) {
  return {
    "patient": enterProperties._patient.toJson(),
    "logout" : enterProperties._logout,
  };
}
