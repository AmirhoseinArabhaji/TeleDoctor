import 'package:flutter/material.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/models/utilities/strings/patient_profile_strings.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/observers_interfaces/observers/observer.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/edit_profile.dart';
import 'package:tele_doctor/views/pages/profile/widgets/patient_profile_widgets/image_profile.dart';
import 'package:tele_doctor/views/pages/profile/widgets/patient_profile_widgets/tab_handler.dart';
import 'package:tele_doctor/views/pages/profile/widgets/profile_raised_button.dart';

class PatientProfile extends StatefulWidget {
  PatientHandler patientHandler;

  PatientProfile(this.patientHandler);

  @override
  _PatientProfileState createState() => _PatientProfileState(patientHandler);
}

class _PatientProfileState extends State<PatientProfile> implements IObserver {
  Patient patient;
  PatientHandler patientHandler;

  _PatientProfileState(this.patientHandler) {
    patientHandler.registerObserver(this);
    patientHandler.notifyObservers();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImage(imageURL: 'assets/person.jpg'),
            ProfileEditButton(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditProfile(patientHandler)));
                  });
                },
                title: patientStrings["editProfileButton"]),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                patientStrings["informationTag"],
                style: TextStyle(fontSize: 28),
              ),
            ),
            tabHandler(context, patientHandler),
          ],
        ),
      ),
    );
  }

  @override
  void update(Object o) {
    this.patient = o as Patient;
  }
}
