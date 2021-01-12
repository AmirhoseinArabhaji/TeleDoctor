import 'package:flutter/material.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/fonts.dart';
import 'package:tele_doctor/viewModels/controllers/drawer_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/logout_button.dart';
import 'package:tele_doctor/views/pages/profile/widgets/profile_raised_button.dart';
import 'package:tele_doctor/views/tele_doctor_text.dart';

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
        height: device.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TeleDoctorText(),
            ),
            SizedBox(
              width: 250,
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      controller.onLoading(context, ph);
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Color(0xff077B95),
                        letterSpacing: 1,
                        fontFamily: "IRANSansMobile",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // LogoutButton(
            //   onTap: () {
            //     controller.onLoading(context, ph);
            //   },
            //   title: "Logout",
            // ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
