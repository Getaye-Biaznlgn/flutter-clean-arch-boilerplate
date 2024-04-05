import 'package:arch_demo/features/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) : super(userId: userId, id: id, title: title, completed: completed);

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
