import 'dart:convert';

class AuthResponseModel {
  Metadata? metadata;
  Response? response;

  AuthResponseModel({this.metadata, this.response});

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(
    Map<String, dynamic> json,
  ) => AuthResponseModel(
    metadata:
        json["metadata"] == null ? null : Metadata.fromMap(json["metadata"]),
    response:
        json["response"] == null ? null : Response.fromMap(json["response"]),
  );

  Map<String, dynamic> toMap() => {
    "metadata": metadata?.toMap(),
    "response": response?.toMap(),
  };
}

class Metadata {
  int? code;
  String? message;

  Metadata({this.code, this.message});

  factory Metadata.fromJson(String str) => Metadata.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Metadata.fromMap(Map<String, dynamic> json) =>
      Metadata(code: json["code"], message: json["message"]);

  Map<String, dynamic> toMap() => {"code": code, "message": message};
}

class Response {
  String? username;
  String? email;
  String? token;

  Response({this.username, this.email, this.token});

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Response.fromMap(Map<String, dynamic> json) => Response(
    username: json["username"],
    email: json["email"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "username": username,
    "email": email,
    "token": token,
  };
}
