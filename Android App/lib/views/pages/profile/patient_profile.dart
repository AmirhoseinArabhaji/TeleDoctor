import 'package:flutter/material.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/image_profile.dart';
import 'package:tele_doctor/views/pages/profile/widgets/profile_raised_button.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/tab_handler.dart';

class PatientProfile extends StatefulWidget {
  @override
  _PatientProfileState createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
//Bellatrix Lestrange
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width:  width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ProfileImage(imageURL: 'assets/person.jpg'),
            ProfileEditButton(onTap: () {
              setState(() {
                Navigator.pushNamed(context, "editProfile");
              });
            }),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                "Information",
                style: TextStyle(fontSize: 28),
              ),
            ),
            tabSection(context),
          ],
        ),
      ),
    );
  }
}

