import 'package:flutter/material.dart';
import 'package:tele_doctor/views/pages/profile/widgets/information/information_text.dart';

class InformationGridView extends StatelessWidget {
  final int crossAxisCount;
  const InformationGridView(
      {Key key, @required this.information, @required this.crossAxisCount})
      : super(key: key);

  final Map<String, String> information;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 120,
      child: GridView.count(
        childAspectRatio: 8.5,
        crossAxisCount: 1,
        children: List.generate(
          information.length,
          (index) {
            return InformationFields(
              information.keys.elementAt(index),
              information.values.elementAt(index),
            );
          },
        ),
      ),
    );
  }
}
