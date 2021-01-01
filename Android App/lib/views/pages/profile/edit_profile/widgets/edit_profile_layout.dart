import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/controllers/edit/edit_profile.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/observers_interfaces/observers/observer.dart';
import 'package:tele_doctor/viewModels/services/local/shared_prefence_controller.dart';
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
  void dispose() async {
    super.dispose();
    SPController controller = SPController();
    EnterProperties ep = EnterProperties(
        token: patientHandler.patient.token,
        firstAppearance: false,
        logout: false,
        patient: patientHandler.patient);
    await controller.save(ep);
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
                      title: AppLocalizations.of(context)
                          .translate("profileInfoTag"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                      controller: _editor.firstName,
                      title: _editor.titleValidation(_patient.firstName,
                          AppLocalizations.of(context).translate("firstName")),
                      isNumber: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _editor.lastName,
                        title: _editor.titleValidation(_patient.lastName,
                            AppLocalizations.of(context).translate("lastName")),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _editor.email,
                        title: _editor.titleValidation(_patient.email,
                            AppLocalizations.of(context).translate("email")),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _editor.phoneNumber,
                        title: _editor.titleValidation(
                            _patient.phoneNumber,
                            AppLocalizations.of(context)
                                .translate("phoneNumber")),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _editor.socialID,
                        title: _editor.titleValidation(_patient.socialID,
                            AppLocalizations.of(context).translate("socialID")),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ChangeDateButton(
                      onTap: () async {
                        DateTime time = await _editor.changeBirthDate(
                            context, _patient.birthDay);
                        print(time);
                      },
                      title: AppLocalizations.of(context)
                          .translate("changeBirthDate"),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LabelText(
                        title: AppLocalizations.of(context)
                            .translate("insuranceInfoTag")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _editor.insuranceCode,
                        title: _editor.titleValidation(
                            _patient.insurance.code,
                            AppLocalizations.of(context)
                                .translate("insuranceCode")),
                        isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                        controller: _editor.insuranceOrgan,
                        title: _editor.titleValidation(
                            _patient.insurance.insuranceOrgan,
                            AppLocalizations.of(context)
                                .translate("insuranceTitle")),
                        isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20),
                    child: ChangeDateButton(
                      title: AppLocalizations.of(context)
                          .translate("changeExpiredDateButton"),
                      onTap: () {
                        _editor.changeExpireDate(
                          context,
                          _patient.insurance.expiredDate,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20),
                    child: EditSubmit(
                      onTap: () async {
                        //Todo submit submit!
                        await _editor.edit(patientHandler);
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
