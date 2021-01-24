import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appoinments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      width: 180,
      height: 180,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          splashColor: Color(0xFFC4FFF9),
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "10:30 - 11:00",
                  style: GoogleFonts.notoSerif(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
