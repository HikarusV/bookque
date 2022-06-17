import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'items.dart';

class UserItems {
  final bool error;
  final String message;
  final String userid;
  final List<Items> items;
  UserItems({
    required this.error,
    required this.message,
    required this.userid,
    required this.items,
  });

  UserItems copyWith({
    bool? error,
    String? message,
    String? userid,
    List<Items>? items,
  }) {
    return UserItems(
      error: error ?? this.error,
      message: message ?? this.message,
      userid: userid ?? this.userid,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'error': error});
    result.addAll({'message': message});
    result.addAll({'userid': userid});
    result.addAll({'items': items.map((x) => x.toMap()).toList()});

    return result;
  }

  factory UserItems.fromMap(Map<String, dynamic> map) {
    return UserItems(
      error: map['error'] ?? false,
      message: map['message'] ?? '',
      userid: map['userid'] ?? '',
      items: List<Items>.from(map['items']?.map((x) => Items.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserItems.fromJson(String source) =>
      UserItems.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserItems(error: $error, message: $message, userid: $userid, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserItems &&
        other.error == error &&
        other.message == message &&
        other.userid == userid &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return error.hashCode ^ message.hashCode ^ userid.hashCode ^ items.hashCode;
  }
}
