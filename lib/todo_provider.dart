import 'package:flutter/material.dart';
import 'package:flutter_2/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;
  void updateTodos(List<TodoModel> value) {
    _todos = value;
    notifyListeners();
  }
}
