import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  final String _title;
  final bool _obscure;
  RegisterTextField({@required String title, @required bool obscure})
      : this._obscure = obscure,
        this._title = title;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        child: TextField(
          obscureText: _obscure,
          controller: _controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            hintText: _title,
          ),
        ),
      ),
    );
  }
}
