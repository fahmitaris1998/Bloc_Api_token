// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str)['data'].map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.name,
    this.itemCompletionStatus,
  });

  int id;
  String name;
  String itemCompletionStatus;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    itemCompletionStatus: json["itemCompletionStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "itemCompletionStatus": itemCompletionStatus,
  };
}
