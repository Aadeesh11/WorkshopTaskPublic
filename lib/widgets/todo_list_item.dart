import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  final int index;
  const TodoListItem({Key key, this.todo, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title, style: const TextStyle(fontSize: 18.0)),
      subtitle: Text(todo.description),
      leading: CircleAvatar(child: Text("${index + 1}")),
    );
  }
}
