import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/device_essentials.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/newVisits/new_visit.dart';
import 'package:tele_doctor/views/pages/notifications/notifications.dart';
import 'package:tele_doctor/views/pages/profile/patient_profile.dart';

import 'my_drawer.dart';

class MainPage extends StatefulWidget {
  PatientHandler patientHandler;
  int index;

  MainPage(this.patientHandler, this.index);

  @override
  _MainPageState createState() =>
      _MainPageState(this.patientHandler, this.index);
}

class _MainPageState extends State<MainPage> {
  ///helps to switch between pages in CurvedNavigationBar
  PatientHandler patientHandler;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _MainPageState(this.patientHandler, int index) {
    this._page = index;
    screens = {
      0: Notifications(),
      1: AddPage(),
      2: PatientProfile(patientHandler),
    };
  }

  int _page;
  GlobalKey _bottomNavigationKey = GlobalKey();
  Map<int, Widget> screens;

  @override
  Widget build(BuildContext context) {
    /** fill device object and get physical Device's informations */
    device = Device(MediaQuery.of(context).size);
    return Scaffold(
      drawer: MyDrawer(ph: patientHandler,),
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 20,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: kAppBar,
      ),
      bottomNavigationBar: CurvedNavigationBar(

        height: device.height/16,
        key: _bottomNavigationKey,
        onTap: (index) {
          setState(
            () {
              _page = index;
            },
          );
        },
        color: kNavBarBottom,
        buttonBackgroundColor: kMainColor,
        backgroundColor: kMainColor,
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
