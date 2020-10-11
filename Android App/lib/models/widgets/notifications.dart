class Notifications {
  String _title;
  DateTime _deadLine;
  Notifications(String title, DateTime dateTime)
      : this._title = title,
        this._deadLine = dateTime;
  String get title => this._title;
  DateTime get deadLine => this._deadLine;

  set title(String title) => this._title = title;
  set deadLine(DateTime dateTime) => this._deadLine = deadLine;
}
