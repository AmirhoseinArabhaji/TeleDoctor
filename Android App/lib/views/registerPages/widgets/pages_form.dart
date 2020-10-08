import 'package:flutter/material.dart';
import 'package:tele_doctor/utilities/colors.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/registerVector.png'),
          ),
          AspectRatio(
            aspectRatio: 83 / 100,
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: kRegisterBoxColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.zero,
                  top: Radius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
