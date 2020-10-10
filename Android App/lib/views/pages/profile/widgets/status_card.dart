import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusCard extends StatelessWidget {
  final String _text;
  final bool _isAvailable;

  const StatusCard({
    Key key,
    @required String text,
    @required bool isAvailable,
  })  : this._text = text,
        this._isAvailable = isAvailable,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.5),
              offset: Offset(5, 8),
              blurRadius: 19),
        ],
        borderRadius: BorderRadius.circular(10),
        gradient: _isAvailable
            ? LinearGradient(
                colors: <Color>[
                  Color(0xFFB3FFE8),
                  Color(0xFF7EEAC9),
                  Color(0xFF47E1B3),
                ],
              )
            : LinearGradient(
                colors: <Color>[
                  Color(0xFFFF5B5B),
                  Color(0xFFF82626),
                  Color(0xFFC20000),
                ],
              ),
      ),
      child: Center(
          child: Text(
        _text,
        style: GoogleFonts.amiri(
          fontSize: 20,
        ),
      )),
    );
  }
}
