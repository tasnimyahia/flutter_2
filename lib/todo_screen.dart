import 'package:flutter/material.dart';
import 'package:flutter_2/todo_model.dart';
import 'package:flutter_2/todo_provider.dart';
import 'package:flutter_2/todos_service.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    _getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: Selector<TodoProvider, List<TodoModel>>(
        selector: (context, provider) => provider.todos,
        builder: (context, todos, _) {
          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(todos[index].title),
              leading: Checkbox(
                  value: todos[index].completed, onChanged: (value) {}),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: todos.length,
          );
        },
      ),
    );
  }

  Future<void> _getTodos() async {
    final todos = await TodosService().getTodos();
    //context.read<TodoProvider>().updateTodos(todos);
    Provider.of<TodoProvider>(context, listen: false).updateTodos(todos);
  }
}
