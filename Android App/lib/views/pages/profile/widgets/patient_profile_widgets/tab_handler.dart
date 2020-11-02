import 'package:flutter/material.dart';
import 'package:tele_doctor/models/person/patient/widgets/insurance.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/insurance_information_section.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/personal_information_section.dart';

Widget tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: <Widget>[
        Container(
          child: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Personal",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Insurance",
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
              SingleChildScrollView(child: PersonalInformation()),
              SingleChildScrollView(child: InsuranceInformation()),
            ],
          ),
        ),
      ],
    ),
  );
}
