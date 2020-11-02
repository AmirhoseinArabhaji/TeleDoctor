import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/strings/sign_up_strings.dart';
import 'package:tele_doctor/viewModels/API_Gate/send_interface.dart';
import 'package:tele_doctor/viewModels/API_Gate/widgets/authentication/user/user.dart';
import 'package:tele_doctor/views/registerPages/widgets/blue_button.dart';
import 'package:tele_doctor/views/registerPages/widgets/register_textfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  User user;
  Send send;
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
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(signUpStrings["upperText"],
                        style: GoogleFonts.pacifico(fontSize: 22))),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RegisterTextField(_email,
                          title: signUpStrings["email"], obscure: false),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RegisterTextField(_password,
                          title: signUpStrings["password"], obscure: true),
                    ),
                  ],
                ),
                Material(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    splashColor: Colors.grey,
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 38,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
