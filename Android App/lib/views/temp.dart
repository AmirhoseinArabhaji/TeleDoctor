import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Template extends StatefulWidget {
  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  TextEditingController fnController = TextEditingController();
  TextEditingController lnController = TextEditingController();

  _submit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("firstName", fnController.text);
    sp.setString("lastName", lnController.text);
  }

  _fetch() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if(sp.get("firstName") == null && sp.get("lastName") == null ) return;
    String firstName = sp.get("firstName");
    String lastName = sp.get("lastName");
  }

  @override
  Widget build(BuildContext context) {
    _fetch();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 100,
                  child: TextField(
                    controller: fnController,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 200,
                  height: 100,
                  child: TextField(
                    controller: lnController,
                  ),
                ),
                Container(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      onPressed: _submit,
                      child: Text("Submit"),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
