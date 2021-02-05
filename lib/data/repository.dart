import 'dart:convert';

Repos reposFromJson(String str) => Repos.fromJson(json.decode(str));

String reposToJson(Repos data) => json.encode(data.toJson());

class Repos {
  Repos({
    this.totalCount,
    this.items,
  });

  int totalCount;
  List<Item> items;

  factory Repos.fromJson(Map<String, dynamic> json) => Repos(
        totalCount: json["total_count"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({this.id, this.name, this.owner, this.score, this.updatedAt});

  int id;
  String name;
  Owner owner;
  DateTime updatedAt;
  int score;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        score: json["watchers_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "owner": owner.toJson(),
        "updated_at": updatedAt.toIso8601String(),
        "watchers_count": score,
      };
}

class Owner {
  Owner({
    this.login,
    this.avatarUrl,
  });

  String login;
  String avatarUrl;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
      };
}
