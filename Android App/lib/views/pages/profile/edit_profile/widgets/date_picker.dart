import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ChangeDateButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const ChangeDateButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return RaisedButton(
      onPressed: onTap,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        width: width - 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xffC0D3DC),
              Color(0xff76A6BC),
              Color(0xff2F7697)
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}

void displayBottomSheet(BuildContext context) {
  DatePicker.showPicker(context, showTitleActions: true, onChanged: (date) {});
}
