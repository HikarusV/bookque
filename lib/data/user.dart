import 'dart:convert';

class User {
  final String userid;
  final String photoid;
  final String nama;
  final String username;
  final String email;
  User({
    required this.userid,
    required this.photoid,
    required this.nama,
    required this.username,
    required this.email,
  });

  User copyWith({
    String? userid,
    String? photoid,
    String? nama,
    String? username,
    String? email,
  }) {
    return User(
      userid: userid ?? this.userid,
      photoid: photoid ?? this.photoid,
      nama: nama ?? this.nama,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userid': userid});
    result.addAll({'photoid': photoid});
    result.addAll({'nama': nama});
    result.addAll({'username': username});
    result.addAll({'email': email});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userid: map['userid'] ?? '',
      photoid: map['photoid'] ?? '',
      nama: map['nama'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(userid: $userid, photoid: $photoid, nama: $nama, username: $username, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.userid == userid &&
        other.photoid == photoid &&
        other.nama == nama &&
        other.username == username &&
        other.email == email;
  }

  @override
  int get hashCode {
    return userid.hashCode ^
        photoid.hashCode ^
        nama.hashCode ^
        username.hashCode ^
        email.hashCode;
  }
}
