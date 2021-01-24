class EmailChecker {
  String _rawEmail;

  EmailChecker({String rawEmail}) : this._rawEmail = rawEmail;

  bool get isValid => _checkEmail;

  bool get _checkEmail => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_rawEmail);
}


