import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/widgets/add_todo_dialogue.dart';

class TodoScreen extends StatefulWidget {
  //Update user interface - use statefulwidgets
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
        title: const Text("My Tasks"),
      ),
      //Done//TODO: Add todo button with this icon => "+".
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 50),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTodoDialogue(),
              ));
        },
      ),
      body: //TODO: Add list view displaying all todo.
          Container(
        child: Center(child: Text("Yay! No Pending Tasks")),
      ),
    );
  }
}
