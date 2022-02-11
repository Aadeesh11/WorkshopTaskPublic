import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';

class TodoListItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //TODO: display title and description of todo.
    return Container();
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
    )
  }
}

