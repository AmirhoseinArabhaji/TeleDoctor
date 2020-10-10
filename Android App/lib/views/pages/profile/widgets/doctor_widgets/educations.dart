import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorLabelTag extends StatelessWidget {
  final String _title;
  final Icon _icon;
  const DoctorLabelTag({@required String title, @required Icon icon})
      : this._icon = icon,
        this._title = title;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        _icon,
        SizedBox(
          width: 10,
        ),
        Text(
          _title,
          style: GoogleFonts.notoSerif(fontSize: 18),
        )
      ],
    ));
  }
}
