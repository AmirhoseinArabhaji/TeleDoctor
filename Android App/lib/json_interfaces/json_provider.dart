import 'dart:io';
import 'dart:convert' as json;
import 'package:path_provider/path_provider.dart';
import 'package:tele_doctor/models/enter_properties/enter_properties.dart';

class JsonProvider {
  File _file;

  getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    _file = File('${directory.path}/ep.json');
  }

  save(EnterProperties ep) {
    String encoded = json.jsonEncode(ep.toJson());
    _file.writeAsString(encoded);
  }

  Future<EnterProperties> load(EnterProperties ep) async {
    Map<String, dynamic> map = json.jsonDecode(await _file.readAsString());
    ep = EnterProperties.fromJson(map);
    return ep;
  }

}
