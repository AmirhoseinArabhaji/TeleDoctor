import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/observers_interfaces/observers/observer.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/edit_profile_layout.dart';

class EditProfile extends StatefulWidget {
  PatientHandler patientHanlder;

  EditProfile(this.patientHanlder);

  @override
  _EditProfileState createState() => _EditProfileState(this.patientHanlder);
}

class _EditProfileState extends State<EditProfile> implements IObserver {
  PatientHandler patientHandler;
  Patient _patient;

  _EditProfileState(this.patientHandler) {
    this.patientHandler.registerObserver(this);
    this.patientHandler.notifyObservers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {

            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.lato(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: EditProfileLayout(patientHandler),
      ),
    );
  }

  @override
  void update(Object o) {
    this._patient = o as Patient;
  }
}
