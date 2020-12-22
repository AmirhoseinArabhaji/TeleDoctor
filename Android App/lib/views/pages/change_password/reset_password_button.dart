import 'package:flutter/material.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';

class ResetPassword extends StatelessWidget {
  final Function onPressed;

  ResetPassword({@required Function onPressed}) : this.onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFC7F6F0),
          Color(0xFF6CF3E3),
          Color(0xFF00FEE0),
        ]),
        borderRadius: BorderRadius.circular(18),
      ),
      width: width / 3,
      height: height / 15,
      child: RaisedButton(
        child: Text(
          AppLocalizations.of(context).translate("reset"),
          style: TextStyle(fontSize: 20),
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        color: Colors.transparent,
        elevation: 20,
        onPressed: () {},
      ),
    );
  }
}
