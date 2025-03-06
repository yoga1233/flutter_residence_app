import 'dart:convert';

class NewsResponseModel {
    Metadata? metadata;
    List<Response>? response;

    NewsResponseModel({
        this.metadata,
        this.response,
    });

    factory NewsResponseModel.fromJson(String str) => NewsResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NewsResponseModel.fromMap(Map<String, dynamic> json) => NewsResponseModel(
        metadata: json["metadata"] == null ? null : Metadata.fromMap(json["metadata"]),
        response: json["response"] == null ? [] : List<Response>.from(json["response"]!.map((x) => Response.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "metadata": metadata?.toMap(),
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toMap())),
    };
}

class Metadata {
    int? code;
    String? message;

    Metadata({
        this.code,
        this.message,
    });

    factory Metadata.fromJson(String str) => Metadata.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
    };
}

class Response {
    String? title;
    String? content;
    String? category;
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    Response({
        this.title,
        this.content,
        this.category,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Response.fromMap(Map<String, dynamic> json) => Response(
        title: json["title"],
        content: json["content"],
        category: json["category"],
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "content": content,
        "category": category,
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
    };
}
