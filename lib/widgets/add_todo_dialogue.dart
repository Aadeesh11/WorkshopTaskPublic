import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';

class AddTodoDialogue extends StatefulWidget {
  const AddTodoDialogue({Key key}) : super(key: key);

  @override
  _AddTodoDialogueState createState() => _AddTodoDialogueState();
}

class _AddTodoDialogueState extends State<AddTodoDialogue> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: SizedBox(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: controller1,
                      decoration: const InputDecoration(labelText: "Title"),
                    ),
                    TextField(
                      controller: controller2,
                      decoration:
                          const InputDecoration(labelText: "Description"),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        child: TextButton(
                      child: const Text("SUBMIT"),
                      onPressed: () {
                        if (controller1.text.isNotEmpty &&
                            controller2.text.isNotEmpty) {
                          String title = controller1.text;
                          String description = controller2.text;

                          Todo newTodo =
                              Todo(title: title, description: description);

                          controller1.clear();
                          controller2.clear();

                          Navigator.pop(context, newTodo);
                        }
                      },
                    ))
                  ],
                ))));
  }
}
