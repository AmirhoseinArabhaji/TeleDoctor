import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeleDoctorText extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff5DF2FF), Color(0xff18AAB7)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Text(
      "Tele Doctor",
      style: GoogleFonts.staatliches(
          fontSize: 50, foreground: Paint()..shader = linearGradient),
    );
  }
}
