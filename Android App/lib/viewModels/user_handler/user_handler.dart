import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/json_interfaces/json_provider.dart';

class UserHandler {
  EnterProperties _enterProperties;
  JsonProvider _jp;

  bool get loggedOut => this._enterProperties.logout;

  bool get hasApiToken => this._enterProperties.token == "null";

  Patient get patient => this.enterProperties.patient;

  void saveUserInFile() async{
    await _jp.save(_enterProperties);
  }

  Future<EnterProperties> fetchUserFromFile() async {
    enterProperties = await this._jp.load(_enterProperties);
    return _enterProperties;
  }

  UserHandler(){
    this._jp = JsonProvider();
  }

  EnterProperties get enterProperties => _enterProperties;

  set enterProperties(EnterProperties value) => _enterProperties = value;
}
