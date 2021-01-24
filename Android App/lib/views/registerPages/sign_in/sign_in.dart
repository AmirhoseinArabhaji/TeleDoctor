import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/viewModels/controllers/sign_in_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/change_password/change_password.dart';
import 'package:tele_doctor/views/pages/change_password/change_password_textfield.dart';
import 'package:tele_doctor/views/registerPages/sign_in/widgets/sign_in_textfield.dart';
import 'package:tele_doctor/views/tele_doctor_text.dart';

import '../../main_page.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  SignInController controller;
  PatientHandler _ph;

  @override
  void initState() {
    super.initState();
    controller = SignInController();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TeleDoctorText(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 18),
                  child: WelcomeText(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 18),
                  child: SignInToContinueText(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Center(
                    child: buildTextFields(width, context, height),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Center(
                    child: SignInButton(
                      width: width,
                      height: height,
                      submit: () {
                        controller.login(_ph);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: buildLowerTexts(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildLowerTexts(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context).translate("lowerText_signIn"),
          style: TextStyle(fontSize: 18),
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
                fontSize: 18,
                decoration: TextDecoration.underline,
                color: Colors.blueAccent),
          ),
        ),
      ],
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
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GestureDetector(
            child: GestureDetector(
              onTap: () async {
                //Todo Check this little shit
                print(controller.firstAppearance());
                if (controller.firstAppearance()) {
                  _ph = await controller.getPH();
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
                AppLocalizations.of(context).translate("forgotPassword"),
                style: TextStyle(
                  fontFamily: "IRANSansMobile",
                  color: Colors.lightBlueAccent,
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
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
              AppLocalizations.of(context).translate("signIn"),
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

class SignInToContinueText extends StatelessWidget {
  const SignInToContinueText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Sign In To Continue",
      // AppLocalizations.of(context).translate("welcome"),
      style: TextStyle(
        fontFamily: "IRANSansMobile",
        color: Colors.black.withOpacity(0.5),
        fontSize: 28,
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate("welcome"),
      style: TextStyle(
        fontFamily: "IRANSansMobile",
        color: Colors.black,
        fontSize: 28,
      ),
    );
  }
}

//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       resizeToAvoidBottomPadding: false,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 1,
//               child: Image(
//                 width: width,
//                 fit: BoxFit.fill,
//                 image: AssetImage('assets/registerVector.png'),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Container(
//                 width: width,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(28.0),
//                       child: buildWelcomText(),
//                     ),
//                     RegisterTextField(signInController.email,
//                         title: AppLocalizations.of(context).translate("email"),
//                         obscure: false),
//                     SizedBox(height: 12),
//                     RegisterTextField(signInController.password,
//                         title:
//                             AppLocalizations.of(context).translate("password"),
//                         obscure: true),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Center(
//                         child: GestureDetector(
//                           onTap: () async {
//                             //Todo Check this little shit
//                             print(signInController.firstAppearance());
//                             if (signInController.firstAppearance()) {
//                               _ph = await signInController.getPH();
//                               print(_ph.patient.password);
//                             }
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ChangePassword(_ph),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             AppLocalizations.of(context)
//                                 .translate("forgotPassword"),
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.blueAccent,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 13),
//                     Center(
//                       child: RegisterBlueButton(
//                           title:
//                               AppLocalizations.of(context).translate("signIn"),
//                           onTap: () async {
//                             try {
//                               _ph = await signInController.send(_ph);
//                               if (_ph.patient.token != "none") {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => MainPage(_ph, 0),
//                                   ),
//                                 );
//                               }
//                             } catch (_) {
//                               if (_ is ConnectionFailed)
//                                 print("Connection Failed");
//                               else if (_ is UserNotFound)
//                                 print("User not Found");
//                             }
//                           }),
//                     ),
//                     SizedBox(height: 21),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           AppLocalizations.of(context)
//                               .translate("lowerText_signIn"),
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, "signUp");
//                           },
//                           child: Text(
//                             AppLocalizations.of(context).translate("signUp"),
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 decoration: TextDecoration.underline,
//                                 color: Colors.blueAccent),
//                           ),
//                         ),
//                       ],
//                     ),
//                     //Todo sign in with google
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                   color: kRegisterBoxColor,
//                   borderRadius: BorderRadius.vertical(
//                     bottom: Radius.zero,
//                     top: Radius.circular(20),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Text buildWelcomText() {
//     return Text(
//       stringsSignIn["welcome"],
//       style: GoogleFonts.peddana(
//         letterSpacing: 3,
//         fontSize: 32,
//         fontWeight: FontWeight.w700,
//       ),
//     );
//   }
// }
