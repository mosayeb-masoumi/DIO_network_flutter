class TodoModel {
  int userId;
  int id;
  String title;
  bool completed;

  TodoModel(this.userId, this.id, this.title, this.completed);

  TodoModel.fromJson(Map<String, dynamic> json)
      : userId = json["userId"] ?? -1,
        id = json["id"] ?? -1,
        title = json["title"] ?? "",
        completed = json["completed"] ?? false;
}
