import 'package:flutter/material.dart';
import 'package:tele_doctor/utilities/colors.dart';
import 'package:tele_doctor/views/registerPages/sign_in/widgets/sign_in_button.dart';
import 'package:tele_doctor/views/registerPages/widgets/blue_button.dart';
import 'package:tele_doctor/views/registerPages/widgets/register_textfield.dart';
import 'package:tele_doctor/views/registerPages/widgets/upper_text.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _email;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UpperText(),
                  RegisterTextField(_email, title: "E-Mail", obscure: false),
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: RegisterTextField(_password,
                        title: "Password", obscure: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21),
                    child: SignInButton(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Center(
                      child: RegisterBlueButton(
                        title: "Create Account",
                        onTap: () {
                          Navigator.pushNamed(context, 'signUp');
                        },
                      ),
                    ),
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
          ),
        ],
      ),
    );
  }
}
