class PatientNotify {
  String _title;
  String _location;
  DateTime _deadLine;
  PatientNotify({String title, DateTime dateTime, String location})
      : this._title = title,
        this._location = location,
        this._deadLine = dateTime;
  String get title => this._title;
  DateTime get deadLine => this._deadLine;
  String get location => this._location;

  set location(String location) => this._location = location;
  set title(String title) => this._title = title;
  set deadLine(DateTime dateTime) => this._deadLine = deadLine;
}
