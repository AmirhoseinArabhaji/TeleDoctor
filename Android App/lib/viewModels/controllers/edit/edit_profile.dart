import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/services/api/connector.dart'
    as connector;
import 'package:http/http.dart' as http;

class ProfileEditor {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController socialID = TextEditingController();
  final TextEditingController insuranceCode = TextEditingController();
  final TextEditingController insuranceOrgan = TextEditingController();
  final TextEditingController insuranceID = TextEditingController();

  //Todo DatePicker Controller for birthday and expiredate
  String titleValidation(String title, String alternative) {
    return title == "" ? alternative : title;
  }

  String controllerTextValidation(String controllerText, String prevValue) {
    return controllerText == "" ? prevValue : controllerText;
  }

  PatientHandler _setPatientData(PatientHandler ph) {
    Patient newPatient = Patient.fromEdit(
        token: ph.patient.token,
        email: email.text,
        password: ph.patient.password,
        userId: ph.patient.userID,
        id: ph.patient.id,
        firstName: firstName.text,
        lastName: lastName.text,
        insuranceCode: insuranceCode.text,
        insuranceID: insuranceID.text,
        insuranceOrgan: insuranceOrgan.text,
        phoneNumber: phoneNumber.text,
        socialID: socialID.text);
    ph.changePatient(newPatient);
    return ph;
  }

  Future<DateTime> changeBirthDate(
      BuildContext context, DateTime currDate) async {
    return DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        currDate = date;
      },
      currentTime: currDate,
    );
  }

  Future<DateTime> changeExpireDate(
      BuildContext context, DateTime currDate) async {
    return DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        currDate = date;
      },
      currentTime: currDate,
    );
  }

  Future<PatientHandler> edit(PatientHandler ph) async {
    ph = _setPatientData(ph);
    http.Response response =
        await connector.editProfile(ph.patient.token, ph.patient.edit());
    // print(response.statusCode);
    print(response.body);
    print(response.statusCode);
    // if(response.statusCode == 200 || response.statusCode == 200 )
  }
}
