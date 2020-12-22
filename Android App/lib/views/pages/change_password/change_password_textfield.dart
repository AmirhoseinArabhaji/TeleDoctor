
import 'package:flutter/material.dart';
import 'package:tele_doctor/models/utilities/colors.dart';

class ChangePasswordTextField extends StatelessWidget {
  ChangePasswordTextField(
      {Key key,
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
  final bool _validate = false;
  final Function onPressed;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 1.5,
      height: height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.remove_red_eye),
          ),
          labelText: labelText,
          errorText: _validate ? "Matches!" : null,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
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
