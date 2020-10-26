import 'package:flutter/material.dart';
import 'package:tele_doctor/utilities/colors.dart';
import 'package:tele_doctor/views/pages/profile/widgets/image_profile.dart';
import 'package:tele_doctor/views/pages/profile/widgets/information/information.dart';
import 'package:tele_doctor/views/pages/profile/widgets/profile_name.dart';
import 'package:tele_doctor/views/pages/profile/widgets/profile_raised_button.dart';

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
      child: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          color: kMainColor,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ProfileImage(imageURL: 'assets/person.jpg'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProfileName(),
                            SizedBox(height: 8),
                            ProfileEditButton(
                              onTap: () {
                                setState(
                                  () {
                                    Navigator.pushNamed(context, "editProfile");
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 3, child: Information()),
            ],
          ),
        ),
      ),
    );
  }
}
