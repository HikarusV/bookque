import 'dart:convert';

class FullItems {
  String itemid;
  int orderid;
  String title;
  String imageid;
  String author;
  String url;
  List<String> categories;
  String shortdesc;
  String longdesc;

  FullItems(
      {this.itemid = 'dagrhj',
      this.orderid = 21,
      this.title = 'title',
      this.imageid = '',
      this.author = 'author',
      this.url = 'url',
      this.categories = const ['E-Boook', 'Teknologi'],
      this.shortdesc = 'Lorem Ipsum',
      this.longdesc =
          'Lorem Ipsum Pellentesque in ipsum id orci porta dapibus'});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'itemid': itemid});
    result.addAll({'orderid': orderid});
    result.addAll({'title': title});
    result.addAll({'imageid': imageid});
    result.addAll({'author': author});
    result.addAll({'url': url});
    result.addAll({'categories': categories});
    result.addAll({'shortdesc': shortdesc});
    result.addAll({'longdesc': longdesc});

    return result;
  }

  factory FullItems.fromMap(Map<String, dynamic> map) {
    final List rawData = map['categories'];
    List<String> data = [];
    for (int i = 0; i < rawData.length; i++) {
      data.add(rawData[i]);
    }

    return FullItems(
      itemid: map['itemid'] ?? '',
      orderid: map['orderid'] ?? '',
      url: map['url'] ?? '',
      title: map['title'] ?? '',
      imageid: map['imageid'] ?? '',
      author: map['author'] ?? '',
      categories: data,
      shortdesc: map['shortdesc'] ?? '',
      longdesc: map['longdesc'] ?? '',
    );
  }

  factory FullItems.fromJson(String source) =>
      FullItems.fromMap(json.decode(source));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemid'] = itemid;
    data['orderid'] = orderid;
    data['title'] = title;
    data['imageid'] = imageid;
    data['author'] = author;
    data['url'] = url;
    data['categories'] = categories;
    data['shortdesc'] = shortdesc;
    data['longdesc'] = longdesc;
    return data;
  }
}
