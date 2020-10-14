import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  final String _title;
  final bool _obscure;
  RegisterTextField(TextEditingController controller,
      {@required String title, @required bool obscure})
      : this._controller = controller,
        this._obscure = obscure,
        this._title = title;
  final TextEditingController _controller;

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
          autofocus: true,
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
