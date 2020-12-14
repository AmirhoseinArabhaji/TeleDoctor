import 'package:flutter/material.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/information_tag.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/strings/patient_profile_strings.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/observers_interfaces/observers/observer.dart';

class PersonalInformation extends StatelessWidget implements IObserver {
  Patient _patient;
  final PatientHandler patientHandler;

  PersonalInformation(PatientHandler patientHandler)
      : this.patientHandler = patientHandler {
    this.patientHandler.registerObserver(this);
    this.patientHandler.notifyObservers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInformationTag(
            Icons.person,
            (_patient.firstName == "" && _patient.lastName == "")
                ? patientStrings["personal"]["fullName"]
                : _patient.firstName + " " + _patient.lastName),
        buildInformationTag(
            Icons.add,
            _patient.email == ""
                ? patientStrings["personal"]["email"]
                : _patient.email),
        buildInformationTag(
            Icons.phone,
            _patient.phoneNumber == ""
                ? patientStrings["personal"]["phone"]
                : _patient.phoneNumber),
        buildInformationTag(
            Icons.perm_identity,
            _patient.socialID == ""
                ? patientStrings["personal"]["socialID"]
                : _patient.socialID),
        buildInformationTag(
            Icons.add,
            _patient.birthDay == null
                ? patientStrings["personal"]["birthDay"]
                : _patient.birthDay.toString()),
      ],
    );
  }

  @override
  void update(Object o) {
    this._patient = o as Patient;
  }
}
