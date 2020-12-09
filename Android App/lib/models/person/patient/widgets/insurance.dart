import 'package:flutter/material.dart';

class Insurance {
  String _code;
  DateTime _expiredDate;
  String _title;

  Insurance({String code = "", String title = ""})
      : this._expiredDate = DateTime.now(),
        this._code = code,
        this._title = title;

  factory Insurance.fromJson(Map<String, dynamic> json) =>
      _$InsuranceFromJson(json);

  set title(String title) => this._title = title;

  String get title => this._title;

  String get code => this._code;

  set code(String code) => this._code = code;

  set expiredDate(DateTime expiredDate) => this._expiredDate = expiredDate;

  DateTime get expiredDate => this._expiredDate;

  Map<String, dynamic> toJson() => _$InsuranceToJson(this);
}

Map<String, dynamic> _$InsuranceToJson(Insurance insurance) {
  return {
    "code": insurance.code,
    "expiredDate": _convertDateTimeToJson(insurance.expiredDate),
    "title": insurance.title,
  };
}

Insurance _$InsuranceFromJson(Map<String, dynamic> json) {
  return Insurance(code: json['code'], title: json['string']);
}

Map<String, dynamic> _convertDateTimeToJson(DateTime dateTime) {
  return {"year": dateTime.year, "month": dateTime.month, "day": dateTime.day};
}

DateTime _convertJsonToDateTime(Map<String, dynamic> json) {
  return DateTime(json["year"], json["month"], json["day"]);
}
