import 'package:flutter/material.dart';

class ProfileButtonCard extends StatelessWidget {
  final String text;
  ProfileButtonCard(this.text);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(
          color: Color(0xFF014F38),
        ),
      ),
      onPressed: () {},
      textColor: Colors.black87,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.5),
                offset: Offset(5, 8),
                blurRadius: 19),
          ],
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFFB3FFE8),
              Color(0xFF7EEAC9),
              Color(0xFF47E1B3),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
