import 'package:flutter/material.dart';
import 'package:tele_doctor/models/utilities/strings/patient_profile_strings.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/insurance_information_section.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/personal_information_section.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';

Widget tabHandler(BuildContext context, PatientHandler patientHandler) {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: <Widget>[
        Container(
          child: TabBar(
            tabs: [
              Tab(
                child: Text(
                  patientStrings["tabs"]["personal"],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  patientStrings["tabs"]["insurance"],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          //Add this to give height
          height: MediaQuery.of(context).size.height / 3,
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: PersonalInformation(patientHandler),
              ),
              SingleChildScrollView(
                child: InsuranceInformation(patientHandler),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
