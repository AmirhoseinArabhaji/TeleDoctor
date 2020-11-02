import 'package:flutter/material.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/information_tag.dart';

class PersonalInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInformationTag(Icons.person, "FirstName LastName"),
        buildInformationTag(Icons.email_outlined, "Template@Template.Tempalte"),
        buildInformationTag(Icons.phone, "Phone Number"),
        buildInformationTag(Icons.perm_identity, "Social ID"),
        buildInformationTag(Icons.calendar_today_outlined, "1984/05/05"),
      ],
    );
  }
}
