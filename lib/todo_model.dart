class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  TodoModel.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        userId = map["userId"],
        completed = map["completed"];
}
  