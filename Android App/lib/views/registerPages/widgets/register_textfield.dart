import 'package:flutter/material.dart';

class RegisterTextField extends StatelessWidget {
  final String _title;
  final bool _obscure;
  final double _width;
  final double _height;
  final TextInputType _inputType;
  RegisterTextField(TextEditingController controller,
      {@required String title,
      @required bool obscure,
      double width = 300,
      double height = 50,
      TextInputType inputType = TextInputType.name})
      : this._controller = controller,
        this._inputType = inputType,
        this._obscure = obscure,
        this._height = height,
        this._width = width,
        this._title = title;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        child: TextField(
          keyboardType: _inputType,
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
