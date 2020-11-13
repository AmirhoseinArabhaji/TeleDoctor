class ProfileEditor {
  String titleValidation(String title, String alternative) {
    return title == "" ? alternative : title;
  }

  String controllerTextValidation(String controllerText, String prevValue) {
    return controllerText == "" ? prevValue : controllerText;
  }
}
