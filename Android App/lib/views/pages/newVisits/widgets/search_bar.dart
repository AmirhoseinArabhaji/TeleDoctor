import 'package:flutter/material.dart';
import 'package:tele_doctor/viewModels/controllers/new_visit_controller.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(
      {Key key,
      @required this.onTap,
      @required this.controller,
      @required this.showSuffix,
      @required this.onChanged,
      @required this.onPressed,
      @required this.search})
      : super(key: key);
  final Function onPressed;
  final Function onChanged;
  final Function search;
  final TextEditingController controller;
  final bool showSuffix;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.1,
      child: TextField(
        textInputAction: TextInputAction.search,
        onEditingComplete: search,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(Icons.search, color: Color(0xff0179C4)),
            onPressed: search,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Color(0xff16211F))),
          suffixIcon: showSuffix
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.close),
                )
              : null,
          hintText: "Search",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0092EC)),
              borderRadius: BorderRadius.circular(11)),
        ),
      ),
    );
  }
}
