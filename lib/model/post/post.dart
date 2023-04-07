import 'dart:convert';

import 'package:http_riverpod_app/model/user/user.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.user
  });

  int? userId;
  int? id;
  String? title;
  String? body;
  User? user;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["UserId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "UserId": userId,
    "id": id,
    "title": title,
    "body": body,
    "user": user?.toJson()
  };
}