import 'package:flutter/material.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/image_profile.dart';

class EditProfilePhoto extends StatelessWidget {
  const EditProfilePhoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.0, 0.8),
      fit: StackFit.passthrough,
      children: [
        Opacity(
            opacity: 1, child: ProfileImage(imageURL: 'assets/person.jpg')),
        Container(
          color: Colors.black,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xFFA4FFCF),
                Color(0xFF71DCA3),
                Color(0xFF5CBD89),
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            Icons.edit,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
