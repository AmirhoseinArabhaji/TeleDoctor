import 'package:flutter/material.dart';

import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/json_interfaces/json_provider.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/registerPages/sign_in/sign_in.dart';
import 'package:tele_doctor/views/registerPages/sign_up/sign_up.dart';

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
    await jp.save(ep = EnterProperties(
        patient: Patient("SADSAD",
            firstName: "asd",
            lastName: "SAD",
            email: "Asd",
            password: "ASDSAD"),
        logout: false));
    ep = await jp.load(ep);
    return ep;
  }

  Scaffold findPage(EnterProperties ep) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ep.logout ? SignIn() : MainPage(),
    );
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
