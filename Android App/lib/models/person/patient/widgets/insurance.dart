import 'package:flutter/material.dart';

class Insurance {
  String _code;
  DateTime _expiredDate;
  String _organ;
  String _id;

  Insurance(
      {String code = "",
      String organ = "",
      String id = "",
      DateTime expireDate})
      : this._expiredDate = expireDate,
        this._code = code,
        this._organ = organ,
        this._id = id;

  factory Insurance.fromJson(Map<String, dynamic> json) =>
      _$InsuranceFromJson(json);

  String get code => this._code;

  set code(String code) => this._code = code;

  set expiredDate(DateTime expiredDate) => this._expiredDate = expiredDate;

  DateTime get expiredDate => this._expiredDate;

  String get insuranceOrgan => _organ;

  set insuranceOrgan(String value) {
    _organ = value;
  }

  Map<String, dynamic> toJson() => _$InsuranceToJson(this);

  String get insuranceID => _id;

  set insuranceID(String value) {
    _id = value;
  }
}

Map<String, dynamic> _$InsuranceToJson(Insurance insurance) {
  return {
    "insurance_id": insurance.insuranceID,
    "booklet_code": insurance.code,
    "booklet_expire_date": _convertDateTimeToJson(insurance.expiredDate),
    "insurance_organ": insurance.insuranceOrgan,
  };
}

Insurance _$InsuranceFromJson(Map<String, dynamic> json) {
  return Insurance(
      code: json['code'],
      id: json["insurance_id"],
      expireDate: json["booklet_expire_date"],
      organ: json["insurance_organ"]);
}

Map<String, dynamic> _convertDateTimeToJson(DateTime dateTime) {
  return {"year": dateTime.year, "month": dateTime.month, "day": dateTime.day};
}

DateTime _convertJsonToDateTime(Map<String, dynamic> json) {
  return DateTime(json["year"], json["month"], json["day"]);
}
