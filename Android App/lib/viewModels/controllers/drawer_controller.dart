import 'package:flutter/material.dart';

//Todo color pallete
//Todo add iran sans font
//Todo reformat api connection
//Todo add auto change language button

class MyDrawerController {
  void logOut(BuildContext context) async {
    Navigator.popAndPushNamed(context, "signIn");
    //Todo add shared prefrences section to this function
  }
}
