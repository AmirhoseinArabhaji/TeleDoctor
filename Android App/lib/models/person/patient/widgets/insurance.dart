import 'package:flutter/material.dart';

class Insurance {
  String _code;
  DateTime _expiredDate;

  Insurance({@required String code, @required DateTime expiredDate})
      : this._expiredDate = expiredDate,
        this._code = code;

  String get code => this._code;

  set code(String code) => this._code = code;



}
