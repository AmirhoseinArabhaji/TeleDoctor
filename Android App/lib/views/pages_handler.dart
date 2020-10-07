import 'package:flutter/material.dart';
import 'package:tele_doctor/views/pages/newVisits/new_visit.dart';
import 'package:tele_doctor/views/pages/notifications/notifications.dart';

import 'package:tele_doctor/views/pages/profile/profile.dart';

Map<int, Widget> screens = {
  0: Notifications(),
  1: AddPage(),
  2: Profile(),
};
