enum Gender { Male, Female, None }

const String FEMALE = "Female";
const String MALE = "Male";

Gender convertStringToGender(String gender) {
  if (gender == MALE)
    return Gender.Male;
  else if (gender == FEMALE) return Gender.Female;
  return null;
}

String convertGenderToString(Gender gender) {
  switch (gender) {
    case Gender.Female:
      return FEMALE;
    case Gender.Male:
      return MALE;
    default:
      return null;
  }
}
