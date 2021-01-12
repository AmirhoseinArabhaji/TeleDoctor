class DoctorFromJson {
  String firstName, lastName;
  String gender;
  int id;
  int userID;
  String specialty;
  String imageURL;

  DoctorFromJson(
      {this.firstName,
      this.lastName,
      this.gender,
      this.id,
      this.specialty,
      this.userID,
      this.imageURL});

  @override
  String toString() {
    return 'DoctorFromJson{firstName: $firstName, lastName: $lastName}';
  }

  factory DoctorFromJson.fromJson(Map<String, dynamic> json) =>
      $_DoctorFromJsonConvertor(json);
}

DoctorFromJson $_DoctorFromJsonConvertor(Map<String, dynamic> json) {
  return DoctorFromJson(
      id: json["id"],
      userID: json["user"]["id"],
      lastName: json["user"]["last_name"],
      firstName: json["user"]["first_name"],
      gender: json["user"]["gender"],
      specialty: json["specialty"],
      imageURL: json["user"]["profile_pic"]);
}
