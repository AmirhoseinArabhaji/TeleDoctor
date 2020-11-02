import 'package:flutter/material.dart';

class ProfileEditButton extends StatelessWidget {
  final Function onTap;

  const ProfileEditButton({Key key, @required Function onTap})
      : this.onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return RaisedButton(
      onPressed: onTap,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: width / 2,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF2FCA8E),
              Color(0xFF238A62),
              Color(0xFF095135),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: const Text('Edit Profile', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
