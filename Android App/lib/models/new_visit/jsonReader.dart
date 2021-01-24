import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tele_doctor/models/new_visit/specialty.dart';

class JsonReader {
  Map<String, dynamic> all;

  void read() async {
    var content = await rootBundle
        .loadString('assets/json_files/sicknesses/sicknesses.json');
    all = await jsonDecode(content);
  }

  Future<List<Specialty>> getList() async {
    await read();
    List<Specialty> list = List<Specialty>();
    all.forEach((key, value) {
      list.add(Specialty.fromJson(value));
    });
    return list;
  }
}
