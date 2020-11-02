
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding buildInformationTag(IconData icon, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
    child: Row(
      children: [
        Expanded(
            flex: 1,
            child: Icon(
              icon,
              size: 35,
            )),
        Expanded(
          flex: 4,
          child: Text(
            title,
            style: GoogleFonts.itim(fontSize: 22),
          ),
        )
      ],
    ),
  );
}
