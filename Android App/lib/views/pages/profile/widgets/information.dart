import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  var _style = GoogleFonts.davidLibre(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  Map<String, String> information = {
    "First Name": "Bellatrix",
    "Last Name": "Lestrange",
    "Age": "29",
    "Phone number": "+44 556 8956",
    "E-Mail": "bellalestrange@gamil.com",
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(
            child: Text("Personal", style: _style),
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
          width: 400,
        ),
        SizedBox(
          height: 13,
        ),
        Container(
          width: 400,
          height: 200,
          child: GridView.count(
            childAspectRatio: 8.5,
            crossAxisCount: 1,
            children: List.generate(
              information.length,
              (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          information.keys.elementAt(index),
                          style: GoogleFonts.arimo(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          information.values.elementAt(
                            index,
                          ),
                          style: GoogleFonts.arimo(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 280,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 13,
        ),
        Container(
          child: Center(
            child: Text(
              "Insurance",
              style: _style,
            ),
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
          width: 400,
        )
      ],
    );
  }
}
