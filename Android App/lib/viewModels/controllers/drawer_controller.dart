import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/viewModels/controllers/sign_up_controller.dart';
import 'package:http/http.dart' as http;
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/services/local/shared_prefence_controller.dart';

//Todo color pallete
//Todo add iran sans font
//Todo reformat api connection
//Todo add auto change language button

class MyDrawerController {
  void logOut(BuildContext context, PatientHandler ph) async {
    SPController sp = SPController();
    EnterProperties ep = EnterProperties(
        patient: ph.patient,
        logout: true,
        token: ph.patient.token,
        firstAppearance: false);
    await sp.save(ep);
    Navigator.popAndPushNamed(context, "signIn");
    //Todo add shared prefrences section to this function
  }
}
