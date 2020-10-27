import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/strings/strings.dart';
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
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image(
              width: width,
              fit: BoxFit.fill,
              image: AssetImage('assets/registerVector.png'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: buildWelcomText(),
                  ),
                  RegisterTextField(_email,
                      title: stringsSignIn["email"], obscure: false),
                  SizedBox(height: 12),
                  RegisterTextField(_password,
                      title: stringsSignIn["password"], obscure: true),
                  SizedBox(height: 36),
                  Center(
                    child: RegisterBlueButton(
                        title: stringsSignIn["submit"], onTap: () {}),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: Text(
                        stringsSignIn["lowerText"],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  //Todo sign in with google
                ],
              ),
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

  Text buildWelcomText() {
    return Text(
      stringsSignIn["welcome"],
      style: GoogleFonts.peddana(
        letterSpacing: 3,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
