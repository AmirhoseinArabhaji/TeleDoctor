import 'package:flutter/material.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/models/utilities/fonts.dart';

class ProfileEditButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const ProfileEditButton({
    Key key,
    @required Function onTap,
    @required String title,
  })  : this.onTap = onTap,
        this.title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: kButtonBorder),
      ),
      elevation: 20,
      onPressed: onTap,
      textColor: kButtonEdit,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: <Color>[
              kGradientFirst,
              kGradientSecond,
              kGradientThird
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(title, style: mainFont),
        ),
      ),
    );
  }
}
