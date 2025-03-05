// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterRequestModel {
  final String username;
  final String email;
  final String password;
  RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
  });

  RegisterRequestModel copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return RegisterRequestModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromJson(String source) =>
      RegisterRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RegisterRequestModel(username: $username, email: $email, password: $password)';

  @override
  bool operator ==(covariant RegisterRequestModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ password.hashCode;
}
