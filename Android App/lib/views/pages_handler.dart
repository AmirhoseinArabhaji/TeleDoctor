import 'package:flutter/material.dart';
import 'package:tele_doctor/views/pages/add_papges.dart';
import 'package:tele_doctor/views/pages/notifications.dart';
import 'package:tele_doctor/views/pages/profile/profile.dart';

Map<int, Widget> screens = {
  0: Notifications(),
  1: AddPage(),
  2: Profile(),
};
