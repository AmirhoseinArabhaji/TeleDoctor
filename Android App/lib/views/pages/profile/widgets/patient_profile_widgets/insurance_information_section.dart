import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/observers_interfaces/observers/observer.dart';
import 'package:tele_doctor/views/pages/profile/widgets/patient_profile_widgets/information_tag.dart';

class InsuranceInformation extends StatelessWidget implements IObserver {
  Patient _patient;
  final PatientHandler patientHandler;

  InsuranceInformation(this.patientHandler) {
    this.patientHandler.registerObserver(this);
    this.patientHandler.notifyObservers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInformationTag(
            FontAwesomeIcons.building,
            _patient.insurance.title == ""
                ? "Company Name"
                : _patient.insurance.title),
        buildInformationTag(
            FontAwesomeIcons.idCard,
            _patient.insurance.code == ""
                ? "Insurance Code"
                : _patient.insurance.code),
      ],
    );
  }

  @override
  void update(Object o) {
    this._patient = o as Patient;
    print(this._patient.insurance);
  }
}
