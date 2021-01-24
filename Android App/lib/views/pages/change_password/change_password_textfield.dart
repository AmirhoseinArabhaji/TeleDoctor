import 'package:flutter/material.dart';
import 'package:tele_doctor/models/utilities/colors.dart';

class ChangePasswordTextField extends StatelessWidget {
  ChangePasswordTextField(
      {Key key,
      @required this.onComplete,
      @required this.validate,
      @required this.width,
      @required this.obscure,
      @required this.height,
      @required this.controller,
      @required this.labelText,
      @required this.onPressed})
      : super(key: key);
  final String labelText;
  final double width;
  final double height;
  final TextEditingController controller;
  final bool validate;
  final Function onPressed;
  final bool obscure;
  final Function onComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 1.5,
      // height: height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        autofocus: false,
        onEditingComplete: onComplete,
        controller: controller,
        obscureText: obscure,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.remove_red_eye),
          ),
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
