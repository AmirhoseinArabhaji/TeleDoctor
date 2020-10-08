import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/utilities/colors.dart';
import 'package:tele_doctor/views/registerPages/sign_up/widgets/lower_text.dart';
import 'package:tele_doctor/views/registerPages/widgets/blue_button.dart';
import 'package:tele_doctor/views/registerPages/widgets/register_textfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: RegisterTextField(
                            title: "First Name", obscure: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 26.0),
                        child: RegisterTextField(
                            title: "Last Name", obscure: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 26.0),
                        child:
                            RegisterTextField(title: "E-Mail", obscure: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 26.0),
                        child:
                            RegisterTextField(title: "Password", obscure: true),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 66.0),
                        child: Center(
                          child: RegisterBlueButton(
                            title: "Submit",
                            onTap: () {
                              //ToDO complete submit
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LowerText(),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Sign In",
                                  style: GoogleFonts.workSans(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
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
        ),
      ),
    );
  }
}
