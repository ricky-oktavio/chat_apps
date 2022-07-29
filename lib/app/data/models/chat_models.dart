// To parse this JSON data, do
//
//     final chatModels = chatModelsFromJson(jsonString);

import 'dart:convert';

ChatModels chatModelsFromJson(String str) =>
    ChatModels.fromJson(json.decode(str));

String chatModelsToJson(ChatModels data) => json.encode(data.toJson());

class ChatModels {
  ChatModels({
    this.connections,
    this.totalChats,
    this.totalRead,
    this.totalUnread,
    this.chat,
    this.lastTime,
  });

  List<String>? connections;
  int? totalChats;
  int? totalRead;
  int? totalUnread;
  List<Chat>? chat;
  String? lastTime;

  factory ChatModels.fromJson(Map<String, dynamic> json) => ChatModels(
        connections: List<String>.from(json["connections"].map((x) => x)),
        totalChats: json["totalChats"],
        totalRead: json["totalRead"],
        totalUnread: json["totalUnread"],
        chat: List<Chat>.from(json["chat"].map((x) => Chat.fromJson(x))),
        lastTime: json["lastTime"],
      );

  Map<String, dynamic> toJson() => {
        "connections": List<dynamic>.from(connections!.map((x) => x)),
        "totalChats": totalChats,
        "totalRead": totalRead,
        "totalUnread": totalUnread,
        "chat": List<dynamic>.from(chat!.map((x) => x.toJson())),
        "lastTime": lastTime,
      };
}

class Chat {
  Chat({
    this.pengirim,
    this.penerima,
    this.pesan,
    this.time,
  });

  String? pengirim;
  String? penerima;
  String? pesan;
  String? time;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        pengirim: json["pengirim"],
        penerima: json["penerima"],
        pesan: json["pesan"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "pengirim": pengirim,
        "penerima": penerima,
        "pesan": pesan,
        "time": time,
      };
}
