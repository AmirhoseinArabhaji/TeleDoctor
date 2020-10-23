import 'package:flutter/material.dart';
import 'package:tele_doctor/json_interfaces/json_provider.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/registerPages/sign_in/sign_in.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget startWidget;

  @override
  void initState() {
    super.initState();
  }

  Future<EnterProperties> _getPage() async {
    EnterProperties ep;
    JsonProvider jp = JsonProvider();
    await jp.getLocalPath();
    jp.save(
      EnterProperties(
        logout: true,
        patient: Patient(
          "asdsad",
          firstName: "asd",
          lastName: "SAD",
          email: "ASD",
          password: "qwer",
        ),
      ),
    );
    ep = await jp.load(ep);
    print(ep.patient);

    return ep;
  }

  Widget findPage(EnterProperties ep) {
    if (ep.logout)
      return SignIn();
    else
      return MainPage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EnterProperties>(
      future: _getPage(),
      builder: (context, snapShot) {
        if (snapShot.hasError) print(snapShot.error);
        return snapShot.hasData
            ? findPage(snapShot.data)
            : Container(
                color: Colors.lightBlueAccent,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
