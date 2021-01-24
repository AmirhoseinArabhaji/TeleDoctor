import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text makeText(String text) {
  return Text(
    text,
    style: GoogleFonts.peddana(
      letterSpacing: 3,
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
  );
}

class UpperText extends StatelessWidget {
  const UpperText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 21),
      child: makeText("Welcome"),
    );
  }
}
