class MyModel {
  final String createdAt;
  final String name;
  final String avatar;
  final String id;

  MyModel(this.createdAt, this.name, this.avatar, this.id);

  MyModel.fromJson(Map<String, dynamic> json)
      : createdAt = json["createdAt"],
        name = json["name"],
        avatar = json["avatar"],
        id = json["id"];
}
