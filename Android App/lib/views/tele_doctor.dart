import 'package:flutter/material.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/controllers/tele_doctor_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/viewModels/services/local/shared_prefence_controller.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/edit_profile.dart';
import 'package:tele_doctor/views/registerPages/sign_in/sign_in.dart';
import 'package:tele_doctor/views/registerPages/sign_up/sign_up.dart';

class TeleDoctor extends StatefulWidget {
  @override
  _TeleDoctorState createState() => _TeleDoctorState();
}

class _TeleDoctorState extends State<TeleDoctor> {
  TeleDoctorController controller;

  @override
  void initState() {
    super.initState();
    controller = TeleDoctorController();
  }

  @override
  void dispose() async{
    super.dispose();
    await controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder<Widget>(
              future: controller.fetch(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return snapshot.data;
                else if (snapshot.hasError)
                  return SignUp();
                else
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
              },
            ),
        'signUp': (context) => SignUp(),
        'signIn': (context) => SignIn(),
        'mainPage': (context) => MainPage(null, 0),
        'editProfile': (context) => EditProfile(null),
      },
    );
  }
}
