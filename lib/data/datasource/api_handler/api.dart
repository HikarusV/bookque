import 'package:http/http.dart' as http;

class Api {
  Future<String> get(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to hit get api');
    }
  }
}
