import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/models/todo.dart';

import 'package:workshop_task/widgets/todo_list_item.dart';

class AddTodoDialogue extends StatefulWidget {
  const AddTodoDialogue({Key key}) : super(key: key);

  @override
  _AddTodoDialogueState createState() => _AddTodoDialogueState();
}

class _AddTodoDialogueState extends State<AddTodoDialogue> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();
  var i = 0;
  List<Widget> lisWig = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Material(
              child: Container(
                  width: 2000,
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 4.0),
                  child: TextField(
                    controller: titlecontroller,
                    decoration: const InputDecoration(
                        hintText: "Title", labelText: "Title"),
                  ))),
          Material(
              child: Container(
                  width: 2000,
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 4.0),
                  child: TextField(
                    controller: desccontroller,
                    decoration: const InputDecoration(
                        hintText: "Description", labelText: "Description"),
                  ))),
          Material(
              child: Container(
                  width: 2000,
                  height: 60,
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 4.0),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();

                          Todo listItem = Todo(
                              title: titlecontroller.text.toString(),
                              description: desccontroller.text.toString());

                          var todoList = TodoList();
                          todoList.addTodo(listItem);

                          TodoListItem wigItem = TodoListItem(
                            todo: todoList.allTodos()[i],
                            index: i + 1,
                          );

                          lisWig.add(wigItem);
                        });
                      },
                      child: const Text('Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )))))
        ],
      ),
    );
  }
}
