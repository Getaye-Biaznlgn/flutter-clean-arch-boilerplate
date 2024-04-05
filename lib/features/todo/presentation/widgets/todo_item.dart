import 'package:arch_demo/features/todo/domain/entities/todo.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    required this.todo,
    super.key,
  });
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(todo.title));
  }
}