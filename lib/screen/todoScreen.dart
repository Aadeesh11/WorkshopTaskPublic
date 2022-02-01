import 'package:flutter/material.dart';
import 'package:workshop_task/models/todoList.dart';
import 'package:workshop_task/widgets/addTodoDialogue.dart';
import 'package:workshop_task/widgets/todoListItem.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoList todoList = TodoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Todos"),
      ),
      //TODO: Add todo button with this icon => "+".
      floatingActionButton: const FloatingActionButton(),
      body: //TODO: Add list view displaying all todo.
          Container(),
    );
  }
}
