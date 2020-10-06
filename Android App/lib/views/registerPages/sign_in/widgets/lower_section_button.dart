import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LowerSectionButton extends StatelessWidget {
  final String _title;
  final double _width;
  const LowerSectionButton({
    Key key,
    @required String title,
    @required double width,
  })  : this._title = title,
        this._width = width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: 50,
      child: Material(
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {},
          splashColor: Color(0xFFDEF2EF),
          child: Center(
            child: Text(
              _title,
              style: GoogleFonts.notoSerif(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        color: Color(0xFF04E6C4),
      ),
    );
  }
}
