import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/person/doctor/widgets/doctor_from_json.dart';

class DoctorCard extends StatefulWidget {
  final DoctorFromJson doctor;

  DoctorCard(this.doctor);

  @override
  _DoctorCardState createState() => _DoctorCardState(doctor);
}

class _DoctorCardState extends State<DoctorCard> {
  final DoctorFromJson doctor;

  _DoctorCardState(this.doctor);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width / 1.1,
        height: height / 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              Color(0xffD4FFE8),
              Color(0xff77FFBD),
              Color(0xff0FF686)
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${doctor.firstName} ${doctor.lastName}",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
                SizedBox(height: 13),
                Text(
                  "${doctor.specialty}",
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
                SizedBox(height: 13),
                Text(
                  "Location",
                  style: GoogleFonts.roboto(fontSize: 20),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
