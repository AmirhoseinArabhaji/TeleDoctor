import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/views/start_page.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class Token {
  String token;

  Token.fromJson(Map<String, String> json) {
    this.token = json["token"];
  }
}
//

class _AddPageState extends State<AddPage> {

  @override
  Widget build(BuildContext context) {
    return Container(color: kMainColor,);
  }
}
