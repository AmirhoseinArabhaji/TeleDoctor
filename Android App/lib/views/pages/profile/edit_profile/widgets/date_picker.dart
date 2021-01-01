import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tele_doctor/models/utilities/colors.dart';

class ChangeDateButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const ChangeDateButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        width: width / 1.5,
        height: height / 18,
        decoration: BoxDecoration(
          border: Border.all(color: kChangePasswordDisableBorder),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(32),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              SizedBox(
                width: width / 40,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
              ),
            ],
          ),
        ));
  }
}
