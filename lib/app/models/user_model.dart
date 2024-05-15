import 'dart:convert';

class UserModel {
  final int? id;
  final String fullname;
  final String email;
  final String password;
  final String username;
  final String phone;
  final String document;

  UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.username,
    required this.phone,
    required this.document,
  });

  @override
  String toString() {
    return 'UserModel(fullname: $fullname, email: $email, password: $password, username: $username, phone: $phone, document: $document)';
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
      'username': username,
      'phone': phone,
      'document': document,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullname: map['fullname'] ?? '',
      email: map['email'] ?? '',
      password: map['token'] ?? '',
      username: map['username'] ?? '',
      phone: map['phone'] ?? '',
      document: map['document'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
