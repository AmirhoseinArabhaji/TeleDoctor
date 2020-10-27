import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/edit_profile_photo.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/edit_textfield.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/widgets/label_text.dart';

class EditProfileLayout extends StatefulWidget {
  @override
  _EditProfileLayoutState createState() => _EditProfileLayoutState();
}
//Todo make calendar

class _EditProfileLayoutState extends State<EditProfileLayout> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EditProfilePhoto(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LabelText(
                      title: "Profile Inof",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(
                      title: "First Name",
                      isNumber: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(title: "LastName", isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(title: "E-Mail", isNumber: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(title: "Phone Number", isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(title: "Social ID", isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(title: "Age", isNumber: true),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LabelText(title: "Insurance Info"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditTextField(title: "Code", isNumber: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20),
                    child: ChangeDateButton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeDateButton extends StatelessWidget {
  const ChangeDateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return RaisedButton(
      onPressed: () {
        displayBottomSheet(context);
      },
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        width: width - 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xffC0D3DC),
              Color(0xff76A6BC),
              Color(0xff2F7697)
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: const Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

void displayBottomSheet(BuildContext context) {
  DatePicker.showPicker(context, showTitleActions: true, onChanged: (date){

  });
}

