import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/services/api/links.dart';
import 'package:tele_doctor/viewModels/services/local/shared_prefence_controller.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/registerPages/sign_in/sign_in.dart';
import 'package:tele_doctor/views/registerPages/sign_up/sign_up.dart';

class TeleDoctorController {
  EnterProperties ep;
  SPController sp;
  PatientHandler ph;

  Future<Widget> fetch() async {
    PatientHandler ph;
    Widget initPage;
    try {
      ep = await sp.fetch(ep);
      ph = PatientHandler(ep.patient);
    } catch (_) {}
    if (!ep.logout && !ep.firstAppearance) {
      initPage = MainPage(ph, 0);
    } else if (ep.logout && ep.firstAppearance) {
      initPage = SignUp();
    } else if (ep.logout && !ep.firstAppearance) {
      initPage = SignIn();
    }
    return initPage;
  }

  TeleDoctorController() {
    ep = EnterProperties();
    sp = SPController();
    fetch();
  }

  Future<void> dispose() async {
    ep.patient = ph.patient;
    await sp.save(ep);
  }
}
