import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        width: 320,
        height: 50,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Color(0xFF2C2CCD),
              width: 1,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            splashColor: Color(0xFFE3F3F1),
            child: Center(
              child: Text(
                "Sign in",
                style: GoogleFonts.notoSerif(
                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
