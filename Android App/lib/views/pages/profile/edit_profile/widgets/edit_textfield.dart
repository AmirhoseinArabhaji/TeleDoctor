import 'package:flutter/material.dart';
import 'package:tele_doctor/models/utilities/colors.dart';

//Todo add text input type

class EditTextField extends StatelessWidget {
  final String title;
  final bool isNumber;
  final TextEditingController controller;

  const EditTextField(
      {Key key,
      @required this.title,
      @required this.isNumber,
      @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 1.5,
      height: height/18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          labelText: title,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kOldPasswordError),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kOldPasswordError),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kChangePasswordDisableBorder),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kChangePasswordFocusBorder),
          ),
        ),
      ),
    );
  }
}
