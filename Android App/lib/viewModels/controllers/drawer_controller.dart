import 'package:flutter/material.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/device_essentials.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/viewModels/services/local/shared_prefence_controller.dart';

class MyDrawerController {
  void logOut(BuildContext context, PatientHandler ph) async {
    SPController sp = SPController();
    EnterProperties ep = EnterProperties(
        patient: ph.patient,
        logout: true,
        token: ph.patient.token,
        firstAppearance: false);
    await sp.save(ep);
    Navigator.popAndPushNamed(context, "signIn");
    //Todo add shared prefrences section to this function
  }

  bool run = true;

  Future<bool> get runValue async => await run;

  void onLoading(BuildContext context, PatientHandler ph) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            width: device.width / 5,
            height: device.height / 5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new CircularProgressIndicator(),
                  SizedBox(
                    width: device.width,
                    height: 60,
                    child: Divider(
                      color: Colors.black,
                      height: 10,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      run = false;
                      Navigator.pop(context); //pop dialog
                    },
                    child: Text(
                      "Cancel",
                      style:
                          TextStyle(fontSize: 22, color: kLogoutGradientSecond),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      FutureBuilder<bool>(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (run) {
            logOut(context, ph);
          } else {
            Navigator.pop(context);
          }
          return;
        },
        future: runValue,
      );
      if (run) {
        logOut(context, ph);
      }
    });
  }
}
