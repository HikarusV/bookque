import 'dart:convert';

class SearchItems {
  final String itemid;
  final String title;
  final String imageid;
  final String author;
  final String shortdesc;
  SearchItems({
    required this.itemid,
    required this.title,
    required this.imageid,
    required this.author,
    required this.shortdesc,
  });

  SearchItems copyWith({
    String? itemid,
    String? title,
    String? imageid,
    String? author,
    String? shortdesc,
  }) {
    return SearchItems(
      itemid: itemid ?? this.itemid,
      title: title ?? this.title,
      imageid: imageid ?? this.imageid,
      author: author ?? this.author,
      shortdesc: shortdesc ?? this.shortdesc,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'itemid': itemid});
    result.addAll({'title': title});
    result.addAll({'imageid': imageid});
    result.addAll({'author': author});
    result.addAll({'shortdesc': shortdesc});

    return result;
  }

  factory SearchItems.fromMap(Map<String, dynamic> map) {
    return SearchItems(
      itemid: map['itemid'] ?? '',
      title: map['title'] ?? '',
      imageid: map['imageid'] ?? '',
      author: map['author'] ?? '',
      shortdesc: map['shortdesc'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchItems.fromJson(String source) =>
      SearchItems.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SearchItems(itemid: $itemid, title: $title, imageid: $imageid, author: $author, shortdesc: $shortdesc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchItems &&
        other.itemid == itemid &&
        other.title == title &&
        other.imageid == imageid &&
        other.author == author &&
        other.shortdesc == shortdesc;
  }

  @override
  int get hashCode {
    return itemid.hashCode ^
        title.hashCode ^
        imageid.hashCode ^
        author.hashCode ^
        shortdesc.hashCode;
  }
}
