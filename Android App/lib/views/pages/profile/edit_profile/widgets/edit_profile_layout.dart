import 'package:flutter/material.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/edit/edit_profile.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/observers_interfaces/observers/observer.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/date_picker.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/edit_profile_photo.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/edit_textfield.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/label_text.dart';

class EditProfileLayout extends StatefulWidget {
  PatientHandler patientHandler;

  EditProfileLayout(this.patientHandler);

  @override
  _EditProfileLayoutState createState() =>
      _EditProfileLayoutState(this.patientHandler);
}
//Todo change dates functionality
//Todo make changes on editing profile

class _EditProfileLayoutState extends State<EditProfileLayout>
    implements IObserver {
  PatientHandler patientHandler;
  Patient _patient;
  ProfileEditor _editor;

  _EditProfileLayoutState(this.patientHandler) {
    this.patientHandler.registerObserver(this);
    this.patientHandler.notifyObservers();
    _editor = ProfileEditor();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EditProfilePhoto(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LabelText(
                      title: "Profile Info",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                      title: _editor.titleValidation(
                          _patient.firstName, "First Name"),
                      isNumber: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        title: _editor.titleValidation(
                            _patient.lastName, "Last Name"),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        title:
                            _editor.titleValidation(_patient.email, "E-Mail"),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        title: _editor.titleValidation(
                            _patient.phoneNumber, "Phone Number"),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        title: _editor.titleValidation(
                            _patient.socialID, "Social ID"),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ChangeDateButton(),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LabelText(title: "Insurance Info"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        title: _editor.titleValidation(
                            _patient.insurance.code, "Insurance Code"),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        title: _editor.titleValidation(
                            _patient.insurance.title, "Insurance Title"),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20),
                    child: ChangeDateButton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void update(Object o) {
    this._patient = o as Patient;
  }
}
