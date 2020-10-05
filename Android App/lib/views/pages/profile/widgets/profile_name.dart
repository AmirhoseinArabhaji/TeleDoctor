import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Bellatrix Lestrange",
      style: GoogleFonts.libreBaskerville(fontSize: 22),
    );
  }
}
