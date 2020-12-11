class Response {
  String _response, _token, _userEmail, _userID, _id;

  Response(
      this._response, this._token, this._userEmail, this._userID, this._id);

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  get id => _id;

  set id(value) {
    _id = value;
  }

  get userID => _userID;

  set userID(value) {
    _userID = value;
  }

  get userEmail => _userEmail;

  set userEmail(value) {
    _userEmail = value;
  }

  get token => _token;

  set token(value) {
    _token = value;
  }

  String get response => _response;

  set response(String value) {
    _response = value;
  }
}

Map<String, dynamic> _$UserToJson(Response response) {
  return {
    "response": response.response,
    "token": response.token,
    "user": {
      "email": response.userEmail,
      "id": response.userID,
    },
    "id": response.id
  };
}

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    json["response"],
    json["token"],
    json["user"]["email"],
    json["user"]["id"],
    json["id"],
  );
}
