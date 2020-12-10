import 'package:flutter/material.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';

import 'models/utilities/device_essentials.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: device.width / 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "LOGO",
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: device.height / 10),
            RaisedButton(
              onPressed: () {},
              child: Container(
                width: (device.width / 1.5) / 1.5,
                height: device.height / 15,
                child: Center(
                  child: Text(AppLocalizations.of(context).translate("logOut")),
                ),
              ),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
