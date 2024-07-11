import 'dart:convert';

import 'package:flutter_2/apis.dart';
import 'package:flutter_2/todo_model.dart';
import 'package:http/http.dart' as http;

class TodosService {
  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(Uri.parse(Apis.todos));
    final data = jsonDecode(response.body) as List<dynamic>;
    final List<TodoModel> todos = [];
    for (var element in data) {
      final todo = TodoModel.fromJson(element);
      todos.add(todo);
    }
    return todos;
  }
}
