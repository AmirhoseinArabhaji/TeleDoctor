class PasswordChecker {
  String _password;

  // bool isValidate() {
  //   return _password.contains("^[\w.]+\$", 0);
  // }

  String get password => _password;

  set password(String value) {
    _password = value;
  }
}
