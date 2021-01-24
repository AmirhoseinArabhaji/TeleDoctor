class User {
  String _email;
  String _password;

  User(this._email, this._password);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String get password => _password;

  set password(String value) => _password = value;

  String get email => _email;

  set email(String value) => _email = value;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json["email"], json["password"]);
}

Map<String, dynamic> _$UserToJson(User user) {
  return <String, dynamic>{
    "user": {
      "email": user.email,
      "password": user.email,
    }
  };
}
