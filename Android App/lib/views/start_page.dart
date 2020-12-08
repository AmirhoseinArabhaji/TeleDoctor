
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/registerPages/sign_in/sign_in.dart';



class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Widget startWidget;
  PatientHandler patientHandler;

  @override
  void initState() {
    super.initState();
  }

  Scaffold findPage(EnterProperties ep) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ep.logout ? SignIn() : MainPage(patientHandler, 0),
    );
  }

  Future<String> getTokenFromAPI() async {
    String username = "amirmojarad13@gmail.com";
    String password = "aA_sd#dSSS_7845__(##ks";
    final response = await http.post(
      "http://Amirhoseinar.pythonanywhere.com/api/login",
      body: {
        "username": username,
        "password": password,
      },
    );
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print("Done");
      return response.body;
    } else
      print(response.statusCode);
  }



  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<EnterProperties>(
    //   future: fetchUserFromFile(),
    //   builder: (context, snapShot) {
    //     if (snapShot.hasError) print(snapShot.error);
    //     if (snapShot.hasData) {
    //       patientHandler = PatientHandler(snapShot.data.patient);
    //     }
    //     return snapShot.hasData
    //         ? findPage(snapShot.data)
    //         : Container(
    //             color: Colors.lightBlueAccent,
    //             child: Center(
    //               child: CircularProgressIndicator(),
    //             ),
    //           );
    //   },
    // );
  }
}
