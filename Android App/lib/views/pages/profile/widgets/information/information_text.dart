import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationFields extends StatelessWidget {
  final String title;
  final String value;

  const InformationFields(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  GoogleFonts.arimo(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              value,
              style: GoogleFonts.arimo(fontSize: 18),
            ),
          ],
        ),
        SizedBox(
          width: 280,
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
