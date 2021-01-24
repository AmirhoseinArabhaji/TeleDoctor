import 'package:flutter/material.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/fonts.dart';

class LogoutButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const LogoutButton({
    Key key,
    @required Function onTap,
    @required String title,
  })  : this.onTap = onTap,
        this.title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: 200,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: <Color>[
              kLogoutGradientFirst,
              kLogoutGradientSecond,
              kLogoutGradientThird
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Center(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "IRANSansMobile",
                    fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
