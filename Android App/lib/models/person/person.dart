import 'package:tele_doctor/models/person/widgets/gender.dart';

class Person {
  final String _token;
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _password;
  String _socialID;
  String _email;
  DateTime _birthDay;
  Gender _gender;
  int _age;


  Person(String token, String email,
      String password)
      : this._token = token,
        this._password = password,
        this._email = email {
    socialID = "";
    phoneNumber = "";
    firstName = "";
    lastName = "";
    _gender = Gender.None;
    _phoneNumber = "";
    this._birthDay = DateTime.now();
  }

  String get password => _password;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get phoneNumber => _phoneNumber;

  String get socialID => _socialID;

  String get email => _email;

  DateTime get birthDay => this._birthDay;

  String get birthDayString => _birthDayString;

  String get token => _token;

  int get age => _age;

  Gender get gender => this._gender;

  set firstName(String firstName) => this._firstName = firstName;

  set lastName(String lastName) => this._lastName = lastName;

  set email(String email) => this._email = email;

  set phoneNumber(String phoneNumber) => this._phoneNumber = phoneNumber;

  set socialID(String socialID) => this._socialID = socialID;

  set birthDay(DateTime birthDay) => this._birthDay = birthDay;

  set password(String password) => this._password = password;

  set age(int age) => this._age = age;

  set gender(Gender gender) => this._gender = gender;




  String get _birthDayString =>
      this.birthDay.year.toString() + "/" + this.birthDay.month.toString() +
          "/" + this.birthDay.day.toString();

}
