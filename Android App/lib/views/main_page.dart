import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/device_essentials.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/newVisits/new_visit.dart';
import 'package:tele_doctor/views/pages/notifications/notifications.dart';
import 'package:tele_doctor/views/pages/profile/patient_profile.dart';
import 'package:tele_doctor/views/pages_handler.dart';

class MainPage extends StatefulWidget {
  PatientHandler patientHandler;

  MainPage(this.patientHandler);

  @override
  _MainPageState createState() => _MainPageState(this.patientHandler);
}

class _MainPageState extends State<MainPage> {
  ///helps to switch between pages in CurvedNavigationBar
  PatientHandler patientHandler;

  _MainPageState(this.patientHandler) {
    screens = {
      0: Notifications(),
      1: AddPage(),
      2: PatientProfile(patientHandler),
    };
  }

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  Map<int, Widget> screens;

  @override
  Widget build(BuildContext context) {
    /** fill device object and get physical Device's informations */
    device = Device(MediaQuery.of(context).size);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        onTap: (index) {
          setState(
            () {
              _page = index;
            },
          );
        },
        color: kNavBarColor,
        buttonBackgroundColor: kMainColor,
        backgroundColor: Color(0x00000000),
        items: [
          Icon(Icons.notifications_active, size: 30, color: kButtonNavBarColor),
          Icon(Icons.add, size: 30, color: kButtonNavBarColor),
          Icon(Icons.person, size: 30, color: kButtonNavBarColor),
        ],
      ),
      body: Container(
        child: screens[_page],
      ),
    );
  }
}
