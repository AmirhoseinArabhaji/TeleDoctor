import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/new_visit/specialty.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:http/http.dart' as http;
import 'package:tele_doctor/viewModels/controllers/new_visit_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/newVisits/new_visit_by_name.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/box_colors.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/search_bar.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/specialty_card.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/sick_types.dart';

class AddPage extends StatefulWidget {
  PatientHandler _ph;

  AddPage(this._ph);

  @override
  _AddPageState createState() => _AddPageState(_ph);
}

//TODO create sickness and json handling
//TODO more page routing
//TODO

class _AddPageState extends State<AddPage> {
  PatientHandler _ph;

  _AddPageState(this._ph);

  bool showSuffix = false;
  NewVisitController controller = NewVisitController();

  void clearSearchText() {
    setState(() {
      controller.clearTextField();
    });
  }

  void onChanged() {
    setState(() {
      controller.onChanged();
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder<List<Widget>>(
      future: controller.generateList(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return SingleChildScrollView(
            child: Container(
              color: kMainColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: SearchBar(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewVisitBySearch(_ph),
                            ),
                          );
                        },
                        controller: controller.searchController,
                        onPressed: () {
                          clearSearchText();
                        },
                        onChanged: (value) {
                          onChanged();
                        },
                        search: () {},
                        showSuffix: controller.showSuffix,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                        child: Text("Choose a Specialty",
                            style: GoogleFonts.roboto(fontSize: 30)),
                      ),
                      Container(
                        width: width,
                        height: height / 2,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 18),
                              child: Row(
                                children: snapshot.data,
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
