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
  final Api? api = Api();

  Future<ListItems> getItems(String userId) async {
    final url = 'http://103.214.185.190:5000/' + userId + '/items';

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = ListItems.fromJson(jsonResponse);

    return items;
  }

  Future<Profile> getUser(String userId) async {
    final url = 'http://103.214.185.190:5000/' + userId + '/profile';

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = Profile.fromJson(jsonResponse);

    return items;
  }

  Future<DetailItems> getDetailItems(String id) async {
    final url = 'http://103.214.185.190:5000/detail/item/' + id;

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = DetailItems.fromJson(jsonResponse);

    return items;
  }

  Future<Category> getCategory(String type) async {
    final url = 'http://103.214.185.190:5000/items/category?cat=' + type;

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = Category.fromJson(jsonResponse);

    return items;
  }

  Future<Searching> getSearch(String query) async {
    final url = 'http://103.214.185.190:5000/search/query?query=' + query;

    final response = await api!.get(url);
    var jsonResponse = jsonDecode(response);

    final items = Searching.fromJson(jsonResponse);

    return items;
  }

  Future<http.Response> postItem(
      String idUser,
      String cover,
      String tipe,
      String url,
      String title,
      String author,
      String description,
      List categories) {
    return http.post(
      Uri.parse('http://103.214.185.190:5000/' + idUser + '/items/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "cover": cover,
        "tipe": tipe,
        "url": url,
        "title": title,
        "author": author,
        "description": description,
        "categories": categories,
      }),
    );
  }

  Future<http.Response> putItemUser(
      String idUser,
      String id,
      String cover,
      String tipe,
      String url,
      String title,
      String author,
      String description,
      List categories) {
    return http.put(
      Uri.parse('http://103.214.185.190:5000/' + idUser + '/items/' + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "cover": cover,
        "tipe": tipe,
        "url": url,
        "title": title,
        "author": author,
        "description": description,
        "categories": categories,
      }),
    );
  }

  Future<http.Response> putProfile(
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

  Future<http.Response> postReport(String id, String pornografi, String link,
      String kategori, String plagiat, String rasis) {
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

  Future<http.Response> deleteAlbum(String userId) async {
    final http.Response response = await http.delete(
      Uri.parse('http://103.214.185.190:5000/' + userId + '/items/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }
}
