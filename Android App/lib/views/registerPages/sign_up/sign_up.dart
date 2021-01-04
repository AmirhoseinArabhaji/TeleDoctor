import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/utilities/strings/sign_up_strings.dart';
import 'package:tele_doctor/viewModels/controllers/sign_up_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/registerPages/widgets/register_textfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController controller;
  bool userAlreadyExist = false;

  void _onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 1), () async {
      PatientHandler ph;
      ph = await controller.send(ph);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(ph, 0),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = SignUpController();
  }

  @override
  Widget build(BuildContext context) {
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
                      child: RegisterTextField(controller.email,
                          title: signUpStrings["email"], obscure: false),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RegisterTextField(controller.password,
                          title: signUpStrings["password"], obscure: true),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      signUpStrings["lowerText"],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "signIn");
                      },
                      child: Text(
                        signUpStrings["signIn"],
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Material(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    splashColor: Colors.grey,
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 38,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            _onLoading(context);
                          },
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
