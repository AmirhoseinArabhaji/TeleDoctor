import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/person.jpg'),
          ),
        ),
      ),
    );
  }
}
