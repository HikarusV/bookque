import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'search_items.dart';

class Searching {
  final bool error;
  final String message;
  final int count;
  final List<SearchItems> items;
  Searching({
    required this.error,
    required this.message,
    required this.count,
    required this.items,
  });

  Searching copyWith({
    bool? error,
    String? message,
    int? count,
    List<SearchItems>? items,
  }) {
    return Searching(
      error: error ?? this.error,
      message: message ?? this.message,
      count: count ?? this.count,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'error': error});
    result.addAll({'message': message});
    result.addAll({'count': count});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Searching.fromMap(Map<String, dynamic> map) {
    return Searching(
      error: map['error'] ?? false,
      message: map['message'] ?? '',
      count: map['count']?.toInt() ?? 0,
      items: List<SearchItems>.from(
          map['items']?.map((x) => SearchItems.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Searching.fromJson(String source) =>
      Searching.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Searching(error: $error, message: $message, count: $count, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Searching &&
        other.error == error &&
        other.message == message &&
        other.count == count &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return error.hashCode ^ message.hashCode ^ count.hashCode ^ items.hashCode;
  }
}
