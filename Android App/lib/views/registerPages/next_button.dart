import 'package:flutter/material.dart';
import 'package:tele_doctor/utilities/colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120),
      child: ClipOval(
        child: Material(
          color: kFirstColorButton,
          child: InkWell(
            splashColor: kSecondColorButton,
            child: SizedBox(
              width: 70,
              height: 70,
              child: Icon(
                Icons.arrow_forward,
                size: 50,
                color: Color(0xFF02000E),
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
