import 'package:flutter/material.dart';
import 'package:tele_doctor/models/widgets/patient_notify.dart';
import 'package:tele_doctor/utilities/colors.dart';
import 'package:tele_doctor/utilities/device_essentials.dart';
import 'package:tele_doctor/views/pages/notifications/widgets/list_card.dart';

class Notifications extends StatefulWidget {
  List<PatientNotify> notifications = [
    PatientNotify(
      location: "Hospital",
      dateTime: DateTime.now(),
      title: "Diarrhea",
    ),
    PatientNotify(
      location: "Hospital",
      dateTime: DateTime.now(),
      title: "Flu",
    ),
    PatientNotify(
      location: "Hospital",
      dateTime: DateTime.now(),
      title: "Stomach Aches",
    ),
  ];
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kMainColor,
        width: device.width,
        height: device.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ListView.builder(
            itemCount: widget.notifications.length,
            itemBuilder: (BuildContext context, int index) {
              return ListCard(
                  notify: widget.notifications[index],
                  onTap: () {
                    setState(() {
                      widget.notifications.removeAt(index);
                    });
                  });
            },
          ),
        ),
      ),
    );
  }
}
