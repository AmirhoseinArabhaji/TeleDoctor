import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/exceptions/connection_failed.dart';
import 'package:tele_doctor/models/exceptions/user_not_found_exception.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/strings/sign_in_strings.dart';
import 'package:tele_doctor/viewModels/controllers/sign_in_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/change_password/change_password.dart';
import 'package:tele_doctor/views/registerPages/widgets/blue_button.dart';
import 'package:tele_doctor/views/registerPages/widgets/register_textfield.dart';

import '../../main_page.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SignInController signInController;
  PatientHandler _ph;

  @override
  void initState() {
    super.initState();
    signInController = SignInController();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: buildWelcomText(),
                    ),
                    RegisterTextField(signInController.email,
                        title: AppLocalizations.of(context).translate("email"),
                        obscure: false),
                    SizedBox(height: 12),
                    RegisterTextField(signInController.password,
                        title:
                            AppLocalizations.of(context).translate("password"),
                        obscure: true),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            //Todo Check this little shit
                            print(signInController.firstAppearance());
                            if (signInController.firstAppearance()) {
                              _ph = await signInController.getPH();
                              print(_ph.patient.password);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePassword(_ph),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)
                                .translate("forgotPassword"),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    Center(
                      child: RegisterBlueButton(
                          title:
                              AppLocalizations.of(context).translate("signIn"),
                          onTap: () async {
                            try {
                              _ph = await signInController.send(_ph);
                              if (_ph.patient.token != "none") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainPage(_ph, 0),
                                  ),
                                );
                              }
                            } catch (_) {
                              if (_ is ConnectionFailed)
                                print("Connection Failed");
                              else if (_ is UserNotFound)
                                print("User not Found");
                            }
                          }),
                    ),
                    SizedBox(height: 21),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)
                              .translate("lowerText_signIn"),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "signUp");
                          },
                          child: Text(
                            AppLocalizations.of(context).translate("signUp"),
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                color: Colors.blueAccent),
                          ),
                        ),
                      ],
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
