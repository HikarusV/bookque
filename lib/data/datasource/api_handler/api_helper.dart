import 'dart:convert';

import 'package:bookque/data/detail_items.dart';
import 'package:bookque/data/list_items.dart';
import 'package:bookque/data/profile.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class HandleApi {
  static final Api? api = Api();

  static Future<UserItems> getItems(String userId) async {
    final url = 'http://103.214.185.190:5000/' + userId + '/items';
    final response = await api!.get(url);

    Map<String, dynamic> jsonResponse = jsonDecode(response);

    final items = UserItems.fromMap(jsonResponse);
    return items;
  }

  static Future<Profile> getUser(String userId) async {
    final url = 'http://103.214.185.190:5000/' + userId + '/profile';

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = Profile.fromJson(jsonResponse);

    return items;
  }

  static Future<DetailItems> getDetailItems(String id) async {
    final url = 'http://103.214.185.190:5000/detail/item/' + id;

    final response = await api!.get(url);
    Map<String, dynamic> jsonResponse = jsonDecode(response);
    // print(jsonResponse);
    final items = DetailItems.fromMap(jsonResponse);

    return items;
  }

  static Future<Map<String, dynamic>> getCategory(String type) async {
    final url = 'http://103.214.185.190:5000/items/category?cat=' + type;
    print(url);

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    // final items = Category.fromJson(jsonResponse);

    return jsonResponse;
  }

  static Future<Map<String, dynamic>> getRecommendationRandomItem() async {
    const url = 'http://103.214.185.190:5000/req/random';

    final response = await api!.get(url);
    Map<String, dynamic> jsonResponse = jsonDecode(response);

    return jsonResponse;
  }

  static Future<Map<String, dynamic>> getNewestItems(String userId,
      {int pages = 1}) async {
    final url = 'http://103.214.185.190:5000/' + userId + '/news?pages=$pages';

    final response = await api!.get(url);
    Map<String, dynamic> jsonResponse = jsonDecode(response);

    return jsonResponse;
  }

  static Future<Map<String, dynamic>> getSearch(String query) async {
    final url = 'http://103.214.185.190:5000/search/query?query=' + query;

    final response = await api!.get(url);
    Map<String, dynamic> jsonResponse = jsonDecode(response);

    // final items = Searching.fromMap(jsonResponse);

    return jsonResponse;
  }

  static Future postEmailVerification(String email) async {
    try {
      final response = await http.post(
        Uri.parse('http://103.214.185.190:5000/email/verify/regist'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "email": email,
        }),
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return {'error': true};
    }
  }

  static Future codeValidation(String email, String code) async {
    try {
      final codeResponse = await http.post(
        Uri.parse('http://103.214.185.190:5000/email/verify/code'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"email": email, "code": code}),
      );

      final response = jsonDecode(codeResponse.body);

      return !response['error'];
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future postNewUser(String pass, String email, String name) async {
    try {
      final createResponse = await http.post(
        Uri.parse('http://103.214.185.190:5000/user/adddata/email'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, dynamic>{"pass": pass, "email": email, "name": name}),
      );

      return jsonDecode(createResponse.body)['error'];
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<dynamic> postItem(
      String idUser,
      String cover,
      String tipe,
      String url,
      String title,
      String author,
      String shortDescription,
      String longDesc,
      String categories) async {
    try {
      final response = await http.post(
        Uri.parse('http://103.214.185.190:5000/' + idUser + '/items'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "imagedata": cover,
          "tipe": tipe,
          "url": url,
          "title": title,
          "author": author,
          "shortdesc": shortDescription,
          "longdesc": longDesc,
          "categories": categories,
        }),
      );
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } catch (e) {
      print(e);
      return 'Error';
    }
  }

  static Future putItemUser({
    required String idUser,
    required String id,
    String cover = "none",
    String url = "none",
    String title = "none",
    String author = "none",
    String shortDescription = "none",
    String longDesc = "none",
  }) async {
    List atribut = [cover, url, title, author, shortDescription, longDesc];
    List atributName = [
      "imagedata",
      "url",
      "title",
      "author",
      "shortDescription",
      "longdesc"
    ];

    Map<String, dynamic> result = <String, dynamic>{};
    for (int i = 0; i < atributName.length; i++) {
      if (!(atribut[i] == "none")) {
        result[atributName[i]] = atribut[i];
      }
    }

    final response = await http.put(
      Uri.parse('http://103.214.185.190:5000/' + idUser + '/items?id=' + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(result),
    );
    return jsonDecode(response.body);
  }

  static Future<http.Response> putProfile(
    String idUser,
    String nama,
    String email,
    String username,
    int profilid,
  ) {
    return http.put(
      Uri.parse('http://103.214.185.190:5000/' + idUser + '/profile/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "nama": nama,
        "email": email,
        "username": username,
        "profileid": profilid,
      }),
    );
  }

  static Future<http.Response> postReport(String id, String pornografi,
      String link, String kategori, String plagiat, String rasis) {
    return http.post(
      Uri.parse('http://103.214.185.190:5000/report' + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "pornografi": pornografi,
        "link": link,
        "kategori": kategori,
        "plagiat": plagiat,
        "rasis": rasis
      }),
    );
  }

  static Future<bool> deleteAlbum(String userId, String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://103.214.185.190:5000/' + userId + '/items?id=' + id),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
    );
    print(response.body);
    Map<String, dynamic> result = jsonDecode(response.body);
    return result['error'];
  }
}
