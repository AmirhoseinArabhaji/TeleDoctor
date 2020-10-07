import 'package:flutter/material.dart';
import 'package:tele_doctor/utilities/colors.dart';
import 'package:tele_doctor/views/registerPages/widgets/register_textfield.dart';
import 'package:tele_doctor/views/registerPages/widgets/upper_text.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _queryData = MediaQuery.of(context);
    return SafeArea(
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/registerVector.png'),
          ),
          AspectRatio(
            aspectRatio: 83 / 100,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UpperText(),
                  RegisterTextField(title: "E-Mail", obscure: false),
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: RegisterTextField(title: "Password", obscure: true),
                  ),
                ],
              ),
              width: 500,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
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
