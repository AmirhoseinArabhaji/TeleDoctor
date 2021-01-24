import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tele_doctor/models/utilities/colors.dart';
import 'package:tele_doctor/viewModels/controllers/new_visit_controller.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/search_bar.dart';

class NewVisitWithSpecialty extends StatefulWidget {
  final String specialty;
  PatientHandler _ph;
  NewVisitWithSpecialty(this.specialty, this._ph);

  @override
  _NewVisitWithSpecialtyState createState() =>
      _NewVisitWithSpecialtyState(this.specialty, this._ph);
}

class _NewVisitWithSpecialtyState extends State<NewVisitWithSpecialty> {
  NewVisitController controller = NewVisitController();

  PatientHandler _ph;

  _NewVisitWithSpecialtyState(this.specialty, this._ph);

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

  final String specialty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              "Search by $specialty ",
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
        child: Container(
          color: kMainColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 28.0, horizontal: 10),
                  child: SearchBar(
                    search: () {},
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
              Container(
                height: height / 1.4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width,
                          height: height / 6,
                          child: Material(
                            borderRadius: BorderRadius.circular(18),
                            color: Color(0xff94ECEC),
                            child: InkWell(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 10,
                                    ),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "FULL NAME",
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                        Text(
                                          "LOCATION",
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                        Text(
                                          "Times Available",
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              borderRadius: BorderRadius.circular(18),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
