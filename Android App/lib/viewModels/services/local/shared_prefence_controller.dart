import 'package:shared_preferences/shared_preferences.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'dart:convert' as json;

import 'package:tele_doctor/models/person/patient/patient.dart';

class SPController {
  SharedPreferences _sp;

  /// fetch data from shared preferences local space
  /// get Enter Properties from sp by Key values
  /// checking null safety
  /// set ep's attributes
  /// return ep
  Future<EnterProperties> fetch(EnterProperties ep) async {
    _sp = await SharedPreferences.getInstance();
    Patient patient = Patient.fromJson(
        await json.jsonDecode(await _sp.get("patient") ?? null) ?? null);
    String token = await _sp.get("token");
    bool logout = await _sp.get("logout");
    bool firstAppearance = await _sp.get("firstAppearance");
    if (firstAppearance == null ||
        logout == null ||
        token == null ||
        patient == null) ep.firstAppearance = false;
    ep.patient = patient;
    ep.token = token;
    ep.logout = logout;
    ep.firstAppearance = firstAppearance;
    return ep;
  }

  ///get instance of shared preference and save all ep's data in it
  save(EnterProperties ep) async {
    _sp = await SharedPreferences.getInstance();
    await _sp.setString("token", ep.token);
    await _sp.setBool("logout", ep.logout);
    await _sp.setBool("firstAppearance", ep.firstAppearance);
    await _sp.setString("patient", json.jsonEncode(ep.patient.toJson()));
  }

  clear() async {
    _sp = await SharedPreferences.getInstance();
    _sp.clear();
  }
}
