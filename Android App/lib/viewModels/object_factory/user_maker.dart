import 'package:tele_doctor/models/enter_properties/enter_properties.dart';
import 'package:tele_doctor/models/person/patient/patient.dart';
import 'package:tele_doctor/viewModels/json_interfaces/json_provider.dart';

Future<EnterProperties> fetchUserFromFile() async {
  EnterProperties ep;
  JsonProvider jp = JsonProvider();
  await jp.getLocalPath();
  await jp.save(
    ep = EnterProperties(
        patient: Patient("SADSAD",
            firstName: "asd",
            lastName: "SAD",
            email: "Asd",
            password: "ASDSAD"),
        logout: false),
  );
  ep = await jp.load(ep);
  return ep;
}
