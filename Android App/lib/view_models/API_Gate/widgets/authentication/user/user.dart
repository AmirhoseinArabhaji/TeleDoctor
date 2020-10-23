import 'package:tele_doctor/models/widgets/gender.dart';

class User {
  String _email;
  String _firstName, _lastName;
  String _phoneNumber;
  String _socialID;
  String _password;
  String _password2;
  Gender _gender;
  User(String email, String password)
      : this._email = email,
        this._password = password;

  String get email => this._email;
  String get firstName => this._firstName;
  String get lastName => this._lastName;
  String get phoneNumber => this._phoneNumber;
  String get socialID => this._socialID;
  String get password2 => this._password2;
  String get password => this._password;
  Gender get gender => this._gender;

  set email(String email) => this._email = email;
  set firstName(String firstName) => this._firstName = firstName;
  set lastName(String lastName) => this._lastName = lastName;
  set phoneNumber(String phoneNumber) => this._phoneNumber = phoneNumber;
  set password(String password) => this._password = password;
  set password2(String password) => this._password2 = password;
  set socialID(String socialID) => this._socialID = socialID;
  set gender(Gender gender) => this._gender = gender;

  @override
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "phoneNumber": phoneNumber,
      "password": password,
      "password2": password2,
      "gender": gender
    };
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
  }
}
