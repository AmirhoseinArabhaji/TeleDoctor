import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/models/utilities/strings/sign_up_strings.dart';
import 'package:tele_doctor/viewModels/controllers/sign_up_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/pages/change_password/change_password_textfield.dart';
import 'package:tele_doctor/views/registerPages/sign_in/widgets/sign_in_textfield.dart';
import 'package:tele_doctor/views/registerPages/widgets/register_textfield.dart';
import 'package:tele_doctor/views/tele_doctor_text.dart';

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
          child: Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(child: CircularProgressIndicator()),
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TeleDoctorText(),
                  SizedBox(
                    height: height / 7,
                  ),
                  Text(
                    "Create",
                    style: GoogleFonts.roboto(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4CA7BC),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Account",
                      style: GoogleFonts.roboto(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff4CA7BC),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: buildTextFields(width, context, height),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          signUpStrings["lowerText"],
                          style: TextStyle(fontSize: 18),
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
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: SignUpButton(
                      height: height,
                      width: width,
                      submit: () {
                        _onLoading(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // child: Padding(
            //   padding: const EdgeInsets.only(top: 100.0),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Center(
            //           child: Text(signUpStrings["upperText"],
            //               style: GoogleFonts.pacifico(fontSize: 22))),
            //       Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: RegisterTextField(controller.email,
            //                 title: signUpStrings["email"], obscure: false),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: RegisterTextField(controller.password,
            //                 title: signUpStrings["password"], obscure: true),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             signUpStrings["lowerText"],
            //             style: TextStyle(fontSize: 16),
            //           ),
            //           SizedBox(
            //             width: 8,
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               Navigator.pushNamed(context, "signIn");
            //             },
            //             child: Text(
            //               signUpStrings["signIn"],
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   decoration: TextDecoration.underline,
            //                   color: Colors.blueAccent),
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 30),
            //       Material(
            //         color: Colors.black87,
            //         borderRadius: BorderRadius.circular(100),
            //         child: InkWell(
            //           borderRadius: BorderRadius.circular(100),
            //           onTap: () {},
            //           splashColor: Colors.grey,
            //           child: Container(
            //             width: 75,
            //             height: 75,
            //             child: Center(
            //               child: IconButton(
            //                 icon: Icon(
            //                   Icons.arrow_forward,
            //                   size: 38,
            //                   color: Colors.white,
            //                 ),
            //                 onPressed: () async {
            //                   _onLoading(context);
            //                 },
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }

  Column buildTextFields(double width, BuildContext context, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignInTextField(
          width: width * 1.2,
          controller: controller.email,
          onComplete: () {},
          validate: true,
          labelText: AppLocalizations.of(context).translate("email"),
        ),
        SizedBox(
          height: 13,
        ),
        ChangePasswordTextField(
          labelText: AppLocalizations.of(context).translate("password"),
          validate: true,
          onComplete: () {},
          height: height,
          width: width * 1.2,
          obscure: true,
          onPressed: () {},
          controller: controller.password,
        ),
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key key,
    @required this.submit,
    @required this.width,
    @required this.height,
  }) : super(key: key);
  final Function submit;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          width: width / 1.3,
          height: height / 14,
          child: RaisedButton(
            color: Color(0xFF2374FF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: submit,
            child: Text(
              AppLocalizations.of(context).translate("signUp"),
              style: TextStyle(
                color: Colors.white,
                fontFamily: "IRANSansMobile",
                fontSize: 27,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
