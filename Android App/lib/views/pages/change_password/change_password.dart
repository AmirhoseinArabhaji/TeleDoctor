import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/device_essentials.dart';
import 'package:tele_doctor/viewModels/controllers/change_password_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/change_password/change_password_layout.dart';
import 'package:tele_doctor/views/pages/change_password/change_password_textfield.dart';

class ChangePassword extends StatefulWidget {
  final PatientHandler ph;

  ChangePassword(this.ph);

  @override
  _ChangePasswordState createState() => _ChangePasswordState(ph);
}

class _ChangePasswordState extends State<ChangePassword> {
  PatientHandler ph;

  _ChangePasswordState(this.ph);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
          AppLocalizations.of(context).translate("changePasswordTitle"),
          style: GoogleFonts.lato(color: Colors.black),
        ),
      ),
      body: ChangePasswordLayout(ph),
    );
  }
}
