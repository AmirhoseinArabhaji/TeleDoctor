import 'package:http/http.dart' as http;

class Connnection {
  final String _url = "http://amirhoseinar.pythonanywhere.com/api/test/";

  Future<int> _getCode() async {
    http.Response response = await http.get(_url);
    return response.statusCode;
  }

  Future<bool> isConnected() async {
    int statusCode = await _getCode();
    if (statusCode == 200) return true;
    return false;
  }
}
