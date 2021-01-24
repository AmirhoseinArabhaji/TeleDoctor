import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:tele_doctor/models/person/doctor/widgets/doctor_from_json.dart';
import 'package:tele_doctor/viewModels/controllers/new_visit_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/search_bar.dart';
import 'package:tele_doctor/viewModels/services/api/connector.dart' as API;

class NewVisitBySearch extends StatefulWidget {
  PatientHandler _ph;

  NewVisitBySearch(this._ph);

  @override
  _NewVisitBySearchState createState() => _NewVisitBySearchState(_ph);
}

class _NewVisitBySearchState extends State<NewVisitBySearch> {
  PatientHandler _ph;
  NewVisitController controller = NewVisitController();

  _NewVisitBySearchState(this._ph);

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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          elevation: 10,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              "Search by Name ",
              style: GoogleFonts.roboto(fontSize: 22),
            ),
          ),
          backgroundColor: Color(0xff44E4C4),
          leading: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 28.0, horizontal: 10),
                    child: SearchBar(
                      search: () async {
                        setState(() {
                          controller.showResults = !controller.showResults;
                        });
                      },
                      onChanged: (value) {
                        onChanged();
                      },
                      onPressed: () {
                        clearSearchText();
                      },
                      controller: controller.searchController,
                      showSuffix: controller.showSuffix,
                      onTap: () {},
                    ),
                  ),
                ),
                controller.showResults
                    ? FutureBuilder(
                        future: controller.searchByName(_ph.patient.token),
                        builder: (context, snapShot) {
                          if (snapShot.hasData) {
                            controller.cards.clear();
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      controller.generateCards(snapShot.data),
                                ),
                              ),
                            );
                          } else if (snapShot.hasError) {
                            return Center(
                              child: Text(
                                "Page Not Found",
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
