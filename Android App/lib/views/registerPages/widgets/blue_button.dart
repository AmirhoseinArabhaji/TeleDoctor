import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterBlueButton extends StatelessWidget {
  final double borderRadius = 15;
  final Function _onTap;
  final String _title;
  RegisterBlueButton(
      {Key key, @required String title, @required Function onTap})
      : _title = title,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 50,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: Color(0xFF96E9F1),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: _onTap,
          onTapCancel: () {},
          splashColor: Color(0xFFEDFDFF),
          child: Center(
            child: Text(
              _title,
              style: GoogleFonts.notoSerif(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
