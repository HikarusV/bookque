import 'dart:convert';

class User {
  final String userid;
  final String name;
  final String usermail;
  User({
    required this.userid,
    required this.name,
    required this.usermail,
  });

  User copyWith({
    String? userid,
    String? name,
    String? usermail,
  }) {
    return User(
      userid: userid ?? this.userid,
      name: name ?? this.name,
      usermail: usermail ?? this.usermail,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userid': userid});
    result.addAll({'name': name});
    result.addAll({'usermail': usermail});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userid: map['userid'] ?? '',
      name: map['name'] ?? '',
      usermail: map['usermail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(userid: $userid, name: $name, usermail: $usermail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.userid == userid &&
        other.name == name &&
        other.usermail == usermail;
  }

  @override
  int get hashCode => userid.hashCode ^ name.hashCode ^ usermail.hashCode;
}
