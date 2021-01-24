import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorCalendar extends StatelessWidget {
  final String _title;
  const DoctorCalendar({
    Key key,
    @required String title,
  })  : this._title = title,
        super(key: key);

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
            child: Text(
              _title,
              style: GoogleFonts.catamaran(fontSize: 26),
            ),
          ),
        ),
      ),
    );
  }
}
