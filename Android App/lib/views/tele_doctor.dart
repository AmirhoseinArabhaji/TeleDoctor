import 'package:flutter/material.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/registerPages/sign_in/sign_in.dart';

class TeleDoctor extends StatefulWidget {
  @override
  _TeleDoctorState createState() => _TeleDoctorState();
}

class _TeleDoctorState extends State<TeleDoctor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage(),
        // 'signUp' : (context) => SignUp()
        'mainPage': (context) => MainPage()
      },
    );
  }
}
