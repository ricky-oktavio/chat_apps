// To parse this JSON data, do
//
//     final usersModels = usersModelsFromJson(jsonString);

import 'dart:convert';

UsersModels usersModelsFromJson(String str) =>
    UsersModels.fromJson(json.decode(str));

String usersModelsToJson(UsersModels data) => json.encode(data.toJson());

class UsersModels {
  UsersModels({
    this.uid,
    this.name,
    this.keyName,
    this.email,
    this.creationTime,
    this.lastSignInTime,
    this.photoUrl,
    this.status,
    this.updatedTime,
    this.chats,
  });

  String? uid;
  String? name;
  String? keyName;
  String? email;
  String? creationTime;
  String? lastSignInTime;
  String? photoUrl;
  String? status;
  String? updatedTime;
  List<ChatUser>? chats;

  factory UsersModels.fromJson(Map<String, dynamic> json) => UsersModels(
        uid: json["uid"],
        name: json["name"],
        keyName: json["keyName"],
        email: json["email"],
        creationTime: json["creationTime"],
        lastSignInTime: json["lastSignInTime"],
        photoUrl: json["photoUrl"],
        status: json["status"],
        updatedTime: json["updatedTime"],
        chats:
            List<ChatUser>.from(json["chats"].map((x) => ChatUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "keyName": keyName,
        "email": email,
        "creationTime": creationTime!,
        "lastSignInTime": lastSignInTime!,
        "photoUrl": photoUrl,
        "status": status,
        "updatedTime": updatedTime,
        "chats": List<dynamic>.from(chats!.map((x) => x.toJson())),
      };
}

class ChatUser {
  ChatUser({
    this.connection,
    this.chatId,
    this.lastTime,
    this.totalUnread,
  });

  String? connection;
  String? chatId;
  String? lastTime;
  int? totalUnread;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        connection: json["connection"],
        chatId: json["chat_id"],
        lastTime: json["lastTime"],
        totalUnread: json["total_unread"],
      );

  Map<String, dynamic> toJson() => {
        "connection": connection,
        "chat_id": chatId,
        "lastTime": lastTime,
        "total_unread": totalUnread,
      };
}
