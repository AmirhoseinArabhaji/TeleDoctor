import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LowerText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Already Have an Account? ",
        style: GoogleFonts.workSans(
            fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700),
      ),
    );
  }
}
