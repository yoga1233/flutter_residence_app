// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel(this.email, this.password);

  LoginRequestModel copyWith({String? email, String? password}) {
    return LoginRequestModel(email ?? this.email, password ?? this.password);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'password': password};
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(map['email'] as String, map['password'] as String);
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginRequestModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginRequestModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
