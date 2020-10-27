import 'package:tele_doctor/viewModels/API_Gate/connection_interface.dart';
import 'package:http/http.dart' as http;

class Send<A> extends Connnection {
  A _object;

  A get object => _object;
  set user(A a) => this._object = a;

  Send({A a}) : this._object = a;

  void post() async {
    bool connected = await isConnected();

  }
}
