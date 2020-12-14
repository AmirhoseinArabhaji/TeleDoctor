import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/localization/app_localization.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/controllers/tele_doctor_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/change_password.dart';
import 'file:///E:/University%20Courses/Term%205/Project/project/tele_doctor_gitVersion/TeleDoctor/Android%20App/lib/viewModels/services/local/shared_prefence_controller.dart';
import 'package:tele_doctor/views/main_page.dart';
import 'package:tele_doctor/views/pages/profile/edit_profile/edit_profile.dart';
import 'package:tele_doctor/views/registerPages/sign_in/sign_in.dart';
import 'package:tele_doctor/views/registerPages/sign_up/sign_up.dart';

class TeleDoctor extends StatefulWidget {
  @override
  _TeleDoctorState createState() => _TeleDoctorState();
}

class _TeleDoctorState extends State<TeleDoctor> {
  TeleDoctorController controller;

  @override
  void initState() {
    super.initState();
    controller = TeleDoctorController();
  }

  @override
  void dispose() async {
    super.dispose();
    await controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fa', 'IR'),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        // GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => FutureBuilder<Widget>(
              future: controller.fetch(),
              builder: (context, snapshot) {
                //Todo Debug fetch function!!!!!
                if (snapshot.hasData)
                  return snapshot.data;
                else if (snapshot.hasError)
                  return SignUp();
                else
                  return Container(
                      child: Container(
                          color: Colors.white,
                          child: Center(child: (CircularProgressIndicator()))));
              },
            ),
        'signUp': (context) => SignUp(),
        'signIn': (context) => SignIn(),
        'mainPage': (context) => MainPage(null, 0),
        'editProfile': (context) => EditProfile(null),
        'changePassword': (context) => ChangePassword(),
      },
    );
  }
}
