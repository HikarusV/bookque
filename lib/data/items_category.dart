import 'dart:convert';

class ItemCategory {
  final String itemid;
  final String title;
  final String imageid;
  final String author;
  final String shortdesc;
  ItemCategory({
    required this.itemid,
    required this.title,
    required this.imageid,
    required this.author,
    required this.shortdesc,
  });

  ItemCategory copyWith({
    String? itemid,
    String? title,
    String? imageid,
    String? author,
    String? shortdesc,
  }) {
    return ItemCategory(
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

  factory ItemCategory.fromMap(Map<String, dynamic> map) {
    return ItemCategory(
      itemid: map['itemid'] ?? '',
      title: map['title'] ?? '',
      imageid: map['imageid'] ?? '',
      author: map['author'] ?? '',
      shortdesc: map['shortdesc'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCategory.fromJson(String source) =>
      ItemCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemCategory(itemid: $itemid, title: $title, imageid: $imageid, author: $author, shortdesc: $shortdesc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemCategory &&
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
