import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tele_doctor/viewModels/services/api/links.dart';
import 'package:tele_doctor/viewModels/services/api/responses/response_login.dart';

@JsonSerializable(nullable: false)
class EnterProperties {
  Patient _patient;
  bool _logout;
  String _token;
  bool _firstAppearance;

  factory EnterProperties.fromJson(Map<String, dynamic> json) =>
      _$EPFromJson(json);

  Map<String, dynamic> toJson() => _$EPToJson(this);

  EnterProperties(
      {bool logout = false,
      Patient patient,
      String token = "null",
      bool firstAppearance = true})
      : this._patient = patient,
        this._logout = logout,
        this._firstAppearance = firstAppearance,
        this._token = token;

  set patient(Patient patient) => this._patient = patient;

  set logout(bool logout) => this._logout = logout;

  set token(String _) => this._token = _;

  set firstAppearance(bool value) => _firstAppearance = value;

  Patient get patient => this._patient;

  bool get logout => this._logout;

  String get token => this._token;

  bool get firstAppearance => _firstAppearance;

  @override
  void fromJson(Map<String, dynamic> json) {
    this._patient = json['patient'];
    this._logout = json['logout'];
    this._token = json['token'];
  }
}

EnterProperties _$EPFromJson(Map<String, dynamic> json) {
  return EnterProperties(
    patient: Patient.fromJson(json['patient']),
    logout: json['logout'] as bool,
    token: json['token'] as String,
  );
}



Map<String, dynamic> _$EPToJson(EnterProperties enterProperties) {
  return {
    "patient": enterProperties._patient.toJson(),
    "logout": enterProperties._logout,
    "token": enterProperties.token,
  };
}
