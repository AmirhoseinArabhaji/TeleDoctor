class ProfileEditor{
  String titleValidation(String title, String alternative){
    return title == "" ? alternative : title;
  }
}