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
    if (ep.patient == null) throw NoSuchMethodError;
    String encoded = json.jsonEncode(ep.toJson());
    _file.writeAsString(encoded);
  }

  Future<bool> get firstEnter async {
    print(await _file.length());
  }

  clear() async {
    try {
      await _file.delete(recursive: true);
    } catch (e) {
//      print(e);
    }
  }

  Future<EnterProperties> load(EnterProperties ep) async {
    Map<String, dynamic> map = json.jsonDecode(await _file.readAsString());
    ep = EnterProperties.fromJson(map);
    return ep;
  }
}
