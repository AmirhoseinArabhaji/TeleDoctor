import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationTag extends StatelessWidget {
  final String tag;
  final _style = GoogleFonts.davidLibre(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  InformationTag(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(tag, style: _style),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.5),
              offset: Offset(5, 8),
              blurRadius: 19),
        ],
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFFE3FDFF),
            Color(0xFF68DEE6),
            Color(0xFF19DDEB),
          ],
        ),
      ),
      height: 50,
      width: 150,
    );
  }
}
