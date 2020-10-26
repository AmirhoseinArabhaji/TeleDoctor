import 'package:flutter/material.dart';
import 'package:tele_doctor/views/pages/profile/widgets/information/information_gridview.dart';
import 'package:tele_doctor/views/pages/profile/widgets/information/information_tag.dart';
import 'package:tele_doctor/views/pages/profile/widgets/profile_card.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  Map<String, String> information = {
    "Age": "29",
    "Phone number": "+44 556 8956",
    "E-Mail": "bellalestrange@gamil.com",
  };
  Map<String, String> insurance = {
    "Code": "456789",
    "Expired At": "2020/07/08"
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          InformationTag("Personal"),
          SizedBox(
            height: 13,
          ),
          InformationGridView(
            information: information,
            crossAxisCount: 1,
          ),
          SizedBox(
            height: 13,
          ),
          InformationTag("Insurance"),
          InformationGridView(information: insurance, crossAxisCount: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 13),
              ProfileButtonCard("Doctors"),
              SizedBox(width: 13),
              ProfileButtonCard("Visits"),
            ],
          )
        ],
      ),
    );
  }
}
