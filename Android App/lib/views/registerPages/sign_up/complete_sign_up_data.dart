import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/widgets/gender.dart';
import 'package:tele_doctor/view_models/API_Gate/widgets/authentication/user/user.dart';
import 'package:tele_doctor/views/registerPages/widgets/register_textfield.dart';

class CompleteSignInInfo extends StatefulWidget {
  final User _user;
  CompleteSignInInfo({@required User user}) : this._user = user;
  @override
  _CompleteSignInInfoState createState() =>
      _CompleteSignInInfoState(user: _user);
}

class _CompleteSignInInfoState extends State<CompleteSignInInfo> {
  final User _user;
  Gender _gender = Gender.Male;
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _socialID = TextEditingController();
  // password confirmation Needed?

  _CompleteSignInInfoState({@required User user}) : this._user = user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Complete your Information",
                  style: GoogleFonts.notoSans(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RegisterTextField(
                              _firstName,
                              title: "First Name",
                              obscure: false,
                              width: 200,
                              height: 40,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RegisterTextField(
                              _firstName,
                              title: "Last name",
                              obscure: false,
                              width: 200,
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RegisterTextField(
                              _firstName,
                              title: "SocialID",
                              obscure: false,
                              width: 200,
                              inputType: TextInputType.number,
                              height: 40,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Gender",
                                style: GoogleFonts.notoSans(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text("Female"),
                                    leading: Radio(
                                      groupValue: _gender,
                                      onChanged: (value) {
                                        setState(() {
                                          _gender = value;
                                        });
                                      },
                                      value: Gender.Female,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text("Male"),
                                    leading: Radio(
                                      groupValue: _gender,
                                      onChanged: (value) {
                                        setState(() {
                                          _gender = value;
                                        });
                                      },
                                      value: Gender.Male,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: 300,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFFBAEEEE),
                                Color(0xFF7BD3D3),
                                Color(0xFF23DEDE)
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Skip",
                                  style: GoogleFonts.notoSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
