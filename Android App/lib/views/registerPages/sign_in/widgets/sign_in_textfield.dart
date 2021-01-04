import 'package:flutter/material.dart';
import 'package:tele_doctor/models/utilities/colors.dart';

class SignInTextField extends StatelessWidget {
  SignInTextField({
    Key key,
    @required this.width,
    @required this.controller,
    @required this.labelText,
    @required this.onComplete,
    @required this.validate,
  }) : super(key: key);
  final double width;
  final String labelText;
  final TextEditingController controller;
  final bool validate;
  final Function onComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        onEditingComplete: onComplete,
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          labelText: labelText,
          errorText: validate ? null : "Not Match!",
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
