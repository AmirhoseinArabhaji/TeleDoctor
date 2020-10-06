import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/views/registerPages/next_button.dart';
import 'package:tele_doctor/views/registerPages/sign_in/widgets/lower_section_button.dart';
import 'package:tele_doctor/views/registerPages/sign_in/widgets/sign_in_textfield.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _style = GoogleFonts.sansita(fontWeight: FontWeight.bold, fontSize: 40);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildWelcomeBack(),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInTextField(
                        controller: _emailController,
                        title: "E-Mail",
                        obscure: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SignInTextField(
                            title: "Password",
                            controller: _passwordController,
                            obscure: true),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: _style,
                    ),
                    NextButton()
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 280,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: Row(
                  children: [
                    LowerSectionButton(
                      title: "Sign Up",
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: LowerSectionButton(
                        title: "Forgot Password",
                        width: 200,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildWelcomeBack() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
            style: _style,
          ),
          Text(
            "Back",
            style: _style,
          )
        ],
      ),
    );
  }
}
