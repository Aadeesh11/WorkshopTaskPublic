import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/widgets/add_todo_dialogue.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  final int index;
  TodoListItem({Key key, this.todo, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: display title and description of todo.

    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
    );
  }
}
