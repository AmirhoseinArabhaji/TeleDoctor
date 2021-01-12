import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/new_visit/specialty.dart';
import 'package:tele_doctor/views/pages/newVisits/new_visit_speciallty.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/box_colors.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/sick_types.dart';

class SpecialtyCard extends StatelessWidget {
  const SpecialtyCard({
    Key key,
    @required this.specialty,
  }) : super(key: key);
  final Specialty specialty;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          splashColor: kSplashColor,
          onTap: () {

          }, // needed
          child: Ink(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    specialty.title,
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      color: Color(0xffF6F2DE),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: specialty.color,
              borderRadius: BorderRadius.circular(18),
            ),
            // use Ink
            width: width / 2.3,
            height: height / 2.5,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
