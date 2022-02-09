import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/models/todo.dart';

class AddTodoDialogue extends StatefulWidget {
  const AddTodoDialogue({Key key}) : super(key: key);

  @override
  _AddTodoDialogueState createState() => _AddTodoDialogueState();
}

class _AddTodoDialogueState extends State<AddTodoDialogue> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();
  int i = 0;
  TodoList listItem = TodoList();
  List<Widget> lisWig = <Widget>[];
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        child: SizedBox(
            height: 200,
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: titlecontroller,
                        decoration: const InputDecoration(labelText: "Title"),
                      ),
                      TextField(
                        controller: desccontroller,
                        decoration:
                            const InputDecoration(labelText: "Description"),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              if (titlecontroller.text.isNotEmpty &&
                                  desccontroller.text.isNotEmpty) {
                                Todo content = Todo(
                                    title: titlecontroller.text,
                                    description: desccontroller.text);

                                listItem.addTodo(content);
                                titlecontroller.clear();
                                desccontroller.clear();
                              }
                            });
                          },
                          child: const Text("Submit"))
                    ]))));
  }
}
