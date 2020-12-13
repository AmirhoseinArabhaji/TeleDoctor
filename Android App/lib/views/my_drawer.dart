import 'package:flutter/material.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/fonts.dart';
import 'package:tele_doctor/viewModels/controllers/drawer_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/logout_button.dart';
import 'package:tele_doctor/views/pages/profile/widgets/profile_raised_button.dart';

import '../models/utilities/device_essentials.dart';

class MyDrawer extends StatelessWidget {
  final MyDrawerController controller = MyDrawerController();
  PatientHandler ph;

  MyDrawer({
    Key key,
    PatientHandler ph,
  }) : super(key: key) {
    this.ph = ph;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: device.width / 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "LOGO",
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: device.height / 10),
            LogoutButton(
                onTap: () {
                  // controller.logOut(context, ph);
                },
                title: "Logout"),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
