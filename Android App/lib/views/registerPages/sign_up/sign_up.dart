import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/widgets/user/user.dart';
import 'package:tele_doctor/utilities/colors.dart';
import 'package:tele_doctor/view_models/API_Gate/send_interface.dart';
import 'package:tele_doctor/views/registerPages/sign_up/complete_sign_up_data.dart';
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

  List<Widget> items = [];

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/registerVector.png'),
            ),
            Expanded(
              child: Container(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Create an Account",
                        style: GoogleFonts.notoSans(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: RegisterTextField(
                              _email,
                              title: "Email",
                              obscure: false,
                              width: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: RegisterTextField(
                              _password,
                              title: "Password",
                              obscure: false,
                              width: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: RegisterBlueButton(
                              title: "Submit",
                              onTap: () {
                                user = User(_email.text, _password.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CompleteSignInInfo(user: user)));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 20,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        Text("Or"),
                        SizedBox(
                          width: 120,
                          height: 20,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(Icons.grid_on_outlined, size: 25),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Sign Up With Google",
                                    style: GoogleFonts.notoSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
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
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
