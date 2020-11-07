import 'package:flutter/material.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/models/utilities/strings/edit_profile_strings.dart';
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
  TextEditingController _firstName;
  TextEditingController _lastName;
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _phoneNumber;
  TextEditingController _socialID;
  TextEditingController _insuranceCode;
  TextEditingController _insuranceTitle;

  _EditProfileLayoutState(this.patientHandler) {
    this.patientHandler.registerObserver(this);
    this.patientHandler.notifyObservers();
    _editor = ProfileEditor();
    this._firstName = TextEditingController();
    this._lastName = TextEditingController();
    this._email = TextEditingController();
    this._socialID = TextEditingController();
    this._insuranceCode = TextEditingController();
    this._insuranceTitle = TextEditingController();
    this._password = TextEditingController();
    this._phoneNumber = TextEditingController();
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
                      title: editProfileStrings["profileInfo"],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                      controller: _firstName,
                      title: _editor.titleValidation(
                          _patient.firstName, editProfileStrings["firstName"]),
                      isNumber: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _lastName,
                        title: _editor.titleValidation(
                            _patient.lastName, editProfileStrings["lastName"]),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _email,
                        title: _editor.titleValidation(
                            _patient.email, editProfileStrings["email"]),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _phoneNumber,
                        title: _editor.titleValidation(_patient.phoneNumber,
                            editProfileStrings["phoneNumber"]),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _socialID,
                        title: _editor.titleValidation(
                            _patient.socialID, editProfileStrings["socialID"]),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ChangeDateButton(
                      onTap: () {},
                      title: _editor.titleValidation(_patient.birthDayString,
                          editProfileStrings["changeBirthDay"]),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        LabelText(title: editProfileStrings["insuranceInfo"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _insuranceCode,
                        title: _editor.titleValidation(_patient.insurance.code,
                            editProfileStrings["insuranceCode"]),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _insuranceTitle,
                        title: _editor.titleValidation(_patient.insurance.title,
                            editProfileStrings["insuranceTitle"]),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20),
                    child: ChangeDateButton(
                        onTap: () {},
                        title: editProfileStrings["changeExpiredDate"]),
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
