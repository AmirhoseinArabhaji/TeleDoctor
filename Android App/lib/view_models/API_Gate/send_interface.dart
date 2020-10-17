import 'package:tele_doctor/models/widgets/interfaces/json_handler.dart';
import 'package:tele_doctor/view_models/API_Gate/connection_interface.dart';
import 'package:http/http.dart' as http;

class Send<A> extends Connnection {
  A _object;

  A get object => _object;
  set user(A a) => this._object = a;

  Send({A a}) : this._object = a;

  void post() async {
    bool connected = await isConnected();
    if (connected) {
      http.Response response =
          await http.post(url, body: (object as JsonHandler).toJson());
    }
  }
}
