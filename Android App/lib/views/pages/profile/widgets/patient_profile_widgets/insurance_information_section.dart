import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/information_tag.dart';

class InsuranceInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInformationTag(FontAwesomeIcons.building, "Insurance Name"),
        buildInformationTag(FontAwesomeIcons.idCard, "56479863")
      ],
    );
  }
}
