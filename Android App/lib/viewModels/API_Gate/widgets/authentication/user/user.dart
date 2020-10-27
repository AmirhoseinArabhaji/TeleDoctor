import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/models/person/widgets/gender.dart';

class User {
  String _email;
  String _password;

  User({String email, String password}) : this._password = password, this._email = email;

  String get email => this._email;
  String get password => this._password;

  set email(String email) => this._email = email;
  set password(String password) => this._password = password;


}
