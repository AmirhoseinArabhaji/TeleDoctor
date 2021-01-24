import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tele_doctor/models/person/widgets/gender.dart';

class LoginResponse {
  String _firstName,
      _lastName,
      _socialID,
      _token,
      _email,
      _phoneNumber,
      _profilePicURL,
      _insuranceID,
      _bookletCode,
      _insuranceOrgan;

  //this is not get from API, it should be set from password textField
  String _password;
  Gender _gender;
  int _id, _patientID;
  DateTime _birthDate, _bookletExpiredDate;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson(LoginResponse response) =>
      _$LoginResponseToJson(response);

  LoginResponse(
      this._firstName,
      this._lastName,
      this._socialID,
      this._token,
      this._email,
      this._phoneNumber,
      this._profilePicURL,
      this._gender,
      this._insuranceID,
      this._bookletExpiredDate,
      this._bookletCode,
      this._insuranceOrgan,
      this._id,
      this._patientID);

  get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  get lastName => _lastName;

  get insuranceOrgan => _insuranceOrgan;

  set insuranceOrgan(value) {
    _insuranceOrgan = value;
  }

  get bookletCode => _bookletCode;

  set bookletCode(value) {
    _bookletCode = value;
  }

  get bookletExpiredDate => _bookletExpiredDate;

  set bookletExpiredDate(String value) {
    _bookletExpiredDate = DateTime.parse(value);
  }

  get insuranceID => _insuranceID;

  set insuranceID(value) {
    _insuranceID = value;
  }

  get gender => _gender;

  set gender(value) {
    _gender = value;
  }

  get profilePicURL => _profilePicURL;

  set profilePicURL(value) {
    _profilePicURL = value;
  }

  get phoneNumber => _phoneNumber;

  set phoneNumber(value) {
    _phoneNumber = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get token => _token;

  set token(value) {
    _token = value;
  }

  get socialID => _socialID;

  set socialID(value) {
    _socialID = value;
  }

  set lastName(value) {
    _lastName = value;
  }

  get patientID => _patientID;

  set patientID(value) {
    _patientID = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  get birthDate => _birthDate;

  set birthDate(String value) {
    _birthDate = DateTime.parse(value);
  }
}

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
      json["first_name"],
      json["last_name"],
      json["social_id"],
      json["token"],
      json["email"],
      json["phone_number"],
      json["profile_pic"],
      convertStringToGender(json["gender"]),
      json["patient"]["insurance_id"],
      json["patient"]["booklet_expired_date"],
      json["patient"]["booklet_code"],
      json["patient"]["insurance_organ"],
      json["id"],
      json["patient"]["id"]);
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse response) {
  return {
    "token": response.token,
    "id": response.id,
    "email": response.email,
    "first_name": response.firstName,
    "last_name": response.lastName,
    "phone_number": response.phoneNumber,
    "profile_pic": response.profilePicURL,
    "gender": convertGenderToString(response.gender),
    "social_id": response.socialID,
    "date_of_birth": response.birthDate.toString(),
    "patient": {
      "id": response.patientID,
      "insurance_id": response.insuranceID,
      "insurance_organ": response.insuranceOrgan,
      "booklet_expired_date": response.bookletExpiredDate.toString(),
      "booklet_code": response.bookletCode
    }
  };
}
