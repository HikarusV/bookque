import 'dart:convert';

import 'package:http/http.dart' as http;

class Unsplash {
  static String baseUrl = 'https://api.unsplash.com/photos';
  static String accessKey =
      '?client_id=P_g_ixJsWK_rWjoWkes6nBLoowZ1Pi-emkbElnNqF9s';

  static Future<Map<String, dynamic>> getRandomPhotos() async {
    final Uri url = Uri.parse(baseUrl + '/random' + accessKey);

    bool error = false;
    Map<String, dynamic>? jsonResponse;

    try {
      final response = await http.get(url);
      jsonResponse = jsonDecode(response.body);
    } on Exception catch (e) {
      error = true;
    }

    final result = {
      "error": error,
      "url": jsonResponse!['urls']['thumb'] ?? 'none',
      "author": jsonResponse['user']['name'] ?? 'none'
    };

    return result;
  }
}
