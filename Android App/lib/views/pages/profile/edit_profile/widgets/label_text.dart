
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
    Shader _linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xff82DACC),
      Color(0xff121873),
      Color(0xff1D8762),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  final String title;
  LabelText({
    Key key,
    @required this.title
  }) : super(key: key){
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.staatliches(
          fontSize: 22,
          foreground: Paint()..shader = _linearGradient),
    );
  }
}
