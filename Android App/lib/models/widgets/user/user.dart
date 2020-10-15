import 'package:tele_doctor/models/widgets/interfaces/json_handler.dart';
import 'package:tele_doctor/models/widgets/gender.dart';

class User implements JsonHandler {
  String _email;
  String _firstName, _lastName;
  String _phoneNumber;
  String _socialID;
  String _password;
  String _password2;
  Gender _gender;

  User({
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String socialID,
    String password,
    String password2,
    Gender gender,
  })  : this._firstName = firstName,
        this._lastName = lastName,
        this._email = email,
        this._gender = gender,
        this._password = password,
        this._password2 = password2,
        this._socialID = socialID,
        this._phoneNumber = phoneNumber;

  String get email => this._email;
  String get firstName => this._firstName;
  String get lastName => this._lastName;
  String get phoneNumber => this._phoneNumber;
  String get socialID => this._socialID;
  String get password2 => this._password2;
  String get password => this._password;
  Gender get gender => this._gender;

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
}
