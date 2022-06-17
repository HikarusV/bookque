import 'dart:convert';

import 'package:bookque/data/models/full_items.dart';

import 'package:bookque/data/models/full_items.dart';

import 'items.dart';

class DetailItems {
  final bool error;
  final String message;
  final FullItems items;
  DetailItems({
    required this.error,
    required this.message,
    required this.items,
  });

  DetailItems copyWith({
    bool? error,
    String? message,
    FullItems? items,
  }) {
    return DetailItems(
      error: error ?? this.error,
      message: message ?? this.message,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'error': error});
    result.addAll({'message': message});
    result.addAll({'items': items.toMap()});

    return result;
  }

  factory DetailItems.fromMap(Map<String, dynamic> map) {
    // print('inHere');
    return DetailItems(
      error: map['error'] ?? false,
      message: map['message'] ?? '',
      items: FullItems.fromMap(map['items']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailItems.fromJson(String source) =>
      DetailItems.fromMap(json.decode(source));

  @override
  String toString() =>
      'DetailItems(error: $error, message: $message, items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailItems &&
        other.error == error &&
        other.message == message &&
        other.items == items;
  }

  @override
  int get hashCode => error.hashCode ^ message.hashCode ^ items.hashCode;
}
