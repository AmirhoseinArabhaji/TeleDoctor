import 'package:flutter/material.dart';

class SignInTextField extends StatelessWidget {
  const SignInTextField({
    Key key,
    @required TextEditingController controller,
    @required String title,
    @required bool obscure,
  })  : _controller = controller,
        _hintTitle = title,
        _obscure = obscure,
        super(key: key);

  final TextEditingController _controller;
  final String _hintTitle;
  final bool _obscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF67F9C3),
        borderRadius: BorderRadius.circular(18),
      ),
      width: 300,
      height: 50,
      child: TextField(
        obscureText: _obscure,
        decoration: InputDecoration(
          hintText: _hintTitle,
          hintStyle: TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        minLines: 1,
        textAlign: TextAlign.center,
        controller: _controller,
      ),
    );
  }
}
