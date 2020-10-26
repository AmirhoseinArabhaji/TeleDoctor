import 'package:tele_doctor/models/widgets/gender.dart';

class Person {
  final String _token;
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _password;
  String _socialID;
  String _email;
  int _age;
  Gender _gender;

  Person(String token, String firstName, String lastName, String email,
      String password)
      : this._token = token,
        this._firstName = firstName,
        this._lastName = lastName,
        this._password = password,
        this._email = email;
  String get password => _password;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phoneNumber => _phoneNumber;
  String get socialID => _socialID;
  String get email => _email;
  int get age => _age;
  String get token => _token;
  Gender get gender => this._gender;

  set firstName(String firstName) => this._firstName = firstName;
  set lastName(String lastName) => this._lastName = lastName;
  set email(String email) => this._email = email;
  set phoneNumber(String phoneNumber) => this._phoneNumber = phoneNumber;
  set socialID(String socialID) => this._socialID = socialID;
  set age(int age) => this._age = age;
  set password(String password) => this._password = password;
  set gender(Gender gender) => this._gender = gender;
}
