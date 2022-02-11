import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/screen/todo_screen.dart';

class AddTodoDialogue extends StatefulWidget {
  const AddTodoDialogue({Key key}) : super(key: key);

  @override
  _AddTodoDialogueState createState() => _AddTodoDialogueState();
}

class _AddTodoDialogueState extends State<AddTodoDialogue> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();
  TodoList listItem = TodoList();
  Widget taskdisplay = Row(
    children: const [
      Center(
        child: Center(child: Text("Yay! No Pending Tasks")),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: SizedBox(
            height: 300,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter title",
                    ),
                    controller: titlecontroller,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter description",
                    ),
                    controller: desccontroller,
                  ),
                  TextButton(
                      child: const Text("Add"),
                      onPressed: () {
                        if (titlecontroller.text.isNotEmpty &&
                            desccontroller.text.isNotEmpty) {
                          setState(() {
                            Todo content = Todo(
                                title: titlecontroller.text,
                                description: desccontroller.text);

                            Navigator.of(context).pop(content);
                          });
                        }
                      }),
                ],
              ),
            )));
  }
}
