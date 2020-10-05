import 'package:flutter/material.dart';

class ProfileEditButton extends StatelessWidget {
  const ProfileEditButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF94E6ED),
              Color(0xFF44BFCA),
              Color(0xFF00A3B2),
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
