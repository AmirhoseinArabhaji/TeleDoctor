import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/views/pages/profile/widgets/doctor_widgets/educations.dart';
import 'package:tele_doctor/views/pages/profile/widgets/doctor_widgets/location_doctor.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/views/pages/profile/widgets/patient_profile_widgets/image_profile.dart';
import 'package:tele_doctor/views/pages/profile/widgets/status_card.dart';

import 'widgets/doctor_widgets/calendar_doctor.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: _isSelected
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
            onPressed: () {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileImage(imageURL: "assets/doctor.jpg"),
                Text(
                  "Hannibal Lecter",
                  style: GoogleFonts.patrickHand(fontSize: 28),
                ),
                Text(
                  "psychologist",
                  style: GoogleFonts.amiri(fontSize: 22),
                ),
                StatusCard(
                  text: "Available",
                  isAvailable: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: 350,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 8),
                        child: DoctorCalendar(title: "Calendar"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 8),
                        child: LocationDoctor(
                          state: "Pennsylvania",
                          city: "Pittsburgh",
                          other: " Allegheny County Jail, 950 Second Avenue",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DoctorLabelTag(
                          title: "University of Baltimore",
                          icon: Icon(
                            Icons.school_sharp,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: DoctorLabelTag(
                            title: "John Hopkins Hospital",
                            icon: Icon(Icons.local_hospital_outlined,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
