import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/person/patient/widgets/patient_notify.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        color: kMainColor,
        width: width,
        height: height,
        child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications_paused,
                  size: 60,
                  color: Colors.black.withOpacity(0.7),
                ),
                Text(
                  "No New Notifications!",
                  style: GoogleFonts.roboto(
                    fontSize: 26,
                    color: Colors.black.withOpacity(0.7),
                  ),
                )
              ],
            ) /*ListView.builder(
            itemCount: widget.notifications.length,
            itemBuilder: (BuildContext context, int index) {
              return ListCard(
                notify: widget.notifications[index],
                onTap: () {
                  setState(
                    () {
                      widget.notifications.removeAt(index);
                    },
                  );
                },
              );
            },
          ),*/
            ),
      ),
    );
  }
}
