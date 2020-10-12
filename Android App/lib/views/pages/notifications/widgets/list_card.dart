import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/widgets/patient_notify.dart';
import 'package:tele_doctor/utilities/colors.dart';
import 'package:tele_doctor/utilities/device_essentials.dart';

class ListCard extends StatelessWidget {
  final Function _onTap;
  final PatientNotify notify;
  const ListCard({@required PatientNotify notify, @required Function onTap})
      : this.notify = notify,
        this._onTap = onTap;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Color(0xFFC61D2B),
          icon: Icons.delete,
          onTap: _onTap,
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.2),
        child: Container(
          width: device.width,
          height: device.height / 10,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.3),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: kListCardColor,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        notify.title,
                        style: GoogleFonts.marcellus(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: device.height / 60),
                      Text(
                        notify.location,
                        style: GoogleFonts.marcellus(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    notify.deadLine.hour.toString() +
                        ":" +
                        (notify.deadLine.minute < 10 ? "0" : "") +
                        notify.deadLine.minute.toString(),
                    style:
                        GoogleFonts.varela(fontSize: 20, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
