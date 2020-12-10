import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/models/utilities/strings/edit_profile_strings.dart';
import 'package:tele_doctor/viewModels/controllers/edit/edit_profile.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/observers_interfaces/observers/observer.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/date_picker.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/edit_profile_photo.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/edit_textfield.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/label_text.dart';
import 'package:tele_doctor/views/pages/profile/patient_profile.dart';

import '../../../../main_page.dart';

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
                      title: AppLocalizations.of(context).translate("profileInfoTag"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                      controller: _firstName,
                      title: _editor.titleValidation(
                          _patient.firstName, AppLocalizations.of(context).translate("firstName")),
                      isNumber: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _lastName,
                        title: _editor.titleValidation(
                            _patient.lastName, AppLocalizations.of(context).translate("lastName")),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _email,
                        title: _editor.titleValidation(
                            _patient.email, AppLocalizations.of(context).translate("email")),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _phoneNumber,
                        title: _editor.titleValidation(_patient.phoneNumber,
                            AppLocalizations.of(context).translate("phoneNumber")),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _socialID,
                        title: _editor.titleValidation(
                            _patient.socialID, AppLocalizations.of(context).translate("socialID")),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ChangeDateButton(
                      onTap: () {},
                      title: _editor.titleValidation(_patient.birthDayString,
                          AppLocalizations.of(context).translate("changeBirthDate")),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        LabelText(title: AppLocalizations.of(context).translate("insuranceInfoTag")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _insuranceCode,
                        title: _editor.titleValidation(_patient.insurance.code,
                            AppLocalizations.of(context).translate("insuranceCode")),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _insuranceTitle,
                        title: _editor.titleValidation(_patient.insurance.title,
                            AppLocalizations.of(context).translate("insuranceTitle")),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20),
                    child: ChangeDateButton(
                        onTap: () {},
                        title: AppLocalizations.of(context).translate("changeExpiredDateButton")),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20),
                    child: EditSubmit(
                      onTap: () {
                        setState(() {
                          this._patient.firstName =
                              _editor.controllerTextValidation(
                                  _firstName.text, _patient.firstName);
                          this._patient.lastName =
                              _editor.controllerTextValidation(
                                  _lastName.text, _patient.lastName);
                          this._patient.email =
                              _editor.controllerTextValidation(
                                  _email.text, _patient.email);
                          this._patient.phoneNumber =
                              _editor.controllerTextValidation(
                                  _phoneNumber.text, _patient.phoneNumber);
                          this._patient.socialID =
                              _editor.controllerTextValidation(
                                  _socialID.text, _patient.socialID);
//                        this._patient.birthDay
                          this._patient.insurance.title =
                              _editor.controllerTextValidation(
                                  _insuranceTitle.text,
                                  _patient.insurance.title);
                          this._patient.insurance.code =
                              _editor.controllerTextValidation(
                                  _insuranceCode.text, _patient.insurance.code);
                          patientHandler.changePatient(_patient);
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    MainPage(patientHandler, 2)),
                          );
                        });
                      },
                      width: width,
                      height: height,
                    ),
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

class EditSubmit extends StatelessWidget {
  final Function onTap;
  final double width;
  final double height;

  const EditSubmit({
    Key key,
    @required this.onTap,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 2,
      height: height / 15,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xFF65DA1D),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          splashColor: Color(0xFFD3E59D),
          child: Center(
            child: Text(
              AppLocalizations.of(context).translate("submit"),
              style: GoogleFonts.notoSerif(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
