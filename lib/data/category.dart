import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'items_category.dart';

class Category {
  final bool error;
  final String message;
  final int count;
  final List<ItemCategory> items;
  Category({
    required this.error,
    required this.message,
    required this.count,
    required this.items,
  });

  Category copyWith({
    bool? error,
    String? message,
    int? count,
    List<ItemCategory>? items,
  }) {
    return Category(
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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      error: map['error'] ?? false,
      message: map['message'] ?? '',
      count: map['count']?.toInt() ?? 0,
      items: List<ItemCategory>.from(
          map['items']?.map((x) => ItemCategory.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Category(error: $error, message: $message, count: $count, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
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
