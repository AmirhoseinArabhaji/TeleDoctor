import 'package:flutter/material.dart';

class Specialty {
  String title;
  Image image;
  Color color;

  Specialty({this.title, this.color});

  Specialty.fromFile({this.title, this.image, this.color});

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyFromJson(json);

  static Map<String, Color> colors = {
    "blue": Color(0xff55E5CB),
    "mediumSpringGreen": Color(0xff22F7A2),
    "blueGreen": Color(0xff0092BB),
    "darkPastelGreen": Color(0xff00C55C),
    "neonGreen": Color(0xff3CE603),
    "lemon": Color(0xffF8F408),
    "spanishOrange": Color(0xffEE640E),
    "redPigment": Color(0xffED0E0E),
    "raspberry": Color(0xffF0035E),
    "purpleX11": Color(0xff9D02F0),
  };

  static Color getColor(String color) {
    return colors[color];
  }
}

Specialty _$SpecialtyFromJson(Map<String, dynamic> json) {
  return Specialty.fromFile(
    color: Specialty.getColor(json["color"]),
    title: json["title"],
    image: Image.asset(json["image"]),
  );
}
