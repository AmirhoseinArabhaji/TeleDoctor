import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tele_doctor/models/new_visit/jsonReader.dart';
import 'package:tele_doctor/models/new_visit/specialty.dart';
import 'package:tele_doctor/models/person/doctor/widgets/doctor_from_json.dart';
import 'package:tele_doctor/viewModels/objects_handler/patient_handler.dart';
import 'package:tele_doctor/views/pages/newVisits/new_visit_speciallty.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/doctor_card.dart';
import 'package:tele_doctor/views/pages/newVisits/widgets/specialty_card.dart';
import 'package:tele_doctor/viewModels/services/api/connector.dart' as API;

class NewVisitController {
  final TextEditingController searchController = TextEditingController();
  bool showSuffix = false;
  final JsonReader jsonReader = JsonReader();
  List<Widget> cards = List<Widget>();
  List<DoctorFromJson> doctors = List<DoctorFromJson>();
  bool showResults = false;
  bool showIndicator = false;

  Future<List<Specialty>> _fetchSpecialties() async {
    return await jsonReader.getList();
  }

  //TODO set doctor from json to cards
  //Todo show progress indicator in stack ,,,, hint use boolean
  //Todo choosing cards functionality

  Future<List<DoctorFromJson>> searchByName(String token) async {
    var queryParams = makeQueryParameters(search: searchController.text);
    Response response = await API.search(token, queryParams);
    var statusCode = response.statusCode;
    var count = jsonDecode(response.body)['count'];
    if (count == 0) throw Exception('Page Not Found');

    if (statusCode == 200) {
      Iterable i = jsonDecode(response.body)["results"];
      doctors =
          List<DoctorFromJson>.from(i.map((e) => DoctorFromJson.fromJson(e)));
      return doctors;
    } else if (statusCode == 404) {
      throw Exception('Page Not Found');
    }
  }

  List<Widget> generateCards(List<DoctorFromJson> doctors) {
    List<Widget> cards = List<Widget>();
    doctors.forEach((element) {
      cards.add(DoctorCard(element));
    });
    return cards;
  }

  void searchBySpecialty(
      String specialty, BuildContext context, PatientHandler ph) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewVisitWithSpecialty(specialty, ph),
      ),
    );
  }

  void clearTextField() {
    showSuffix = false;
    searchController.text = "";
  }

  void onChanged() {
    if (searchController.text == "") {
      showSuffix = false;
    } else {
      showSuffix = true;
    }
  }

  void onTap() {}

  Future<List<Widget>> generateList() async {
    List<Specialty> specialties = await _fetchSpecialties();
    cards = List<Widget>();
    specialties.forEach((element) {
      cards.add(SpecialtyCard(
        specialty: element,
      ));
    });
    return cards;
  }

  Map<String, String> makeQueryParameters(
      {String search, String ordering = "", int page = 0}) {
    return {'search': '$search' /*, 'page': '$page'*/, 'ordering': '$ordering'};
  }
}
