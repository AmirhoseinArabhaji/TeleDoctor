import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationDoctor extends StatelessWidget {
  final String _city;
  final String _state;
  final String _other;

  LocationDoctor(
      {@required String state, @required String city, @required String other})
      : this._state = state,
        this._city = city,
        this._other = other;

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
              SizedBox(
                height: 8,
              ),
              Text(
                _state,
                style:
                    GoogleFonts.lora(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _city,
                style:
                    GoogleFonts.lora(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                _other,
                style: GoogleFonts.lora(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
