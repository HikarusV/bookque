import 'dart:convert';

import 'user.dart';

class Profile {
  final bool error;
  final String message;
  final User user;
  Profile({
    required this.error,
    required this.message,
    required this.user,
  });

  Profile copyWith({
    bool? error,
    String? message,
    User? user,
  }) {
    return Profile(
      error: error ?? this.error,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'error': error});
    result.addAll({'message': message});
    result.addAll({'user': user.toMap()});

    return result;
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      error: map['error'] ?? false,
      message: map['message'] ?? '',
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));

  @override
  String toString() => 'Profile(error: $error, message: $message, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Profile &&
        other.error == error &&
        other.message == message &&
        other.user == user;
  }

  @override
  int get hashCode => error.hashCode ^ message.hashCode ^ user.hashCode;
}
