import 'package:bookque/data/category.dart';
import 'package:http/http.dart' as http;
import 'package:bookque/data/category.dart';
import 'package:bookque/data/detail_items.dart';
import 'package:bookque/data/items.dart';
import 'package:bookque/data/list_items.dart';
import 'package:bookque/data/profile.dart';
import 'package:bookque/data/search.dart';
import 'package:bookque/data/user.dart';
import 'api.dart';
import 'dart:convert';
import 'package:bookque/data/items.dart';

class HandleApi {
  static final Api? api = Api();

  static Future<ListItems> getItems(String userId) async {
    final url = 'http://103.214.185.190:5000/' + userId + '/items';

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = ListItems.fromJson(jsonResponse);

    return items;
  }

  static Future<Profile> getUser(String userId) async {
    final url = 'http://103.214.185.190:5000/' + userId + '/profile';

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);
    print('test result : $jsonResponse');

    final items = Profile.fromJson(jsonResponse);

    return items;
  }

  static Future<DetailItems> getDetailItems(String id) async {
    final url = 'http://103.214.185.190:5000/detail/item/' + id;

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = DetailItems.fromJson(jsonResponse);

    return items;
  }

  static Future<Category> getCategory(String type) async {
    final url = 'http://103.214.185.190:5000/items/category?cat=' + type;

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = Category.fromJson(jsonResponse);

    return items;
  }

  static Future<Searching> getSearch(String query) async {
    final url = 'http://103.214.185.190:5000/search/query?query=' + query;

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = Searching.fromJson(jsonResponse);

    return items;
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

  static Future postItem(
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
      return jsonDecode(response.body);
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
      "longDesc"
    ];
    print('start');
    Map<String, dynamic> result = <String, dynamic>{};
    int firstComa = 1;
    for (int i = 0; i < 5; i++) {
      if (!(atribut[i] == "none")) {
        print('loop-$i');
        // result =
        //     '$result${firstComa-- == 1 ? "" : ","}"${atributName[i]}":"${atribut[i]}"';
        result[atributName[i]] = atribut[i];
      }
    }
    // print(result);
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

  static Future<http.Response> deleteAlbum(String userId) async {
    final http.Response response = await http.delete(
      Uri.parse('http://103.214.185.190:5000/' + userId + '/items/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }
}
