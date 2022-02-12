import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';

class AddTodoDialogue extends StatefulWidget {
  const AddTodoDialogue({Key key}) : super(key: key);

  @override
  _AddTodoDialogueState createState() => _AddTodoDialogueState();
}

class _AddTodoDialogueState extends State<AddTodoDialogue> {
  final TextEditingController myController1 = TextEditingController();
  final TextEditingController myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: SizedBox(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: myController1,
                      decoration: const InputDecoration(labelText: "Title"),
                    ),
                    TextField(
                      controller: myController2,
                      decoration:
                          const InputDecoration(labelText: "Description"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (myController1.text.isNotEmpty &&
                              myController2.text.isNotEmpty) {
                            setState(() {
                              String title = myController1.text;
                              String description = myController2.text;

                              Todo newincomingTodo =
                                  Todo(title: title, description: description);

                              myController1.clear();
                              myController2.clear();

                              Navigator.pop(context, newincomingTodo);
                            });
                          }
                        });
                      },
                      child: const Text("Submit"),
                    )
                  ],
                )))
        // width: 200,
        // padding: const EdgeInsets.all(16),
        // child: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     TextField(
        //       controller: myController1,
        //       decoration: const InputDecoration(labelText: "Title"),
        //     ),
        //     TextField(
        //       controller: myController2,
        //       decoration: const InputDecoration(labelText: "Description"),
        //     ),
        //     const SizedBox(height: 18),
        //     SizedBox(
        //         child: TextButton(
        //       child: const Text("Submit"),
        //       onPressed: () {
        //         if (myController1.text.isNotEmpty &&
        //             myController2.text.isNotEmpty) {
        //           setState(() {
        //             String title = myController1.text;
        //             String description = myController2.text;

        //             Todo newTodo = Todo(title: title, description: description);

        //             todoList.addTodo(newTodo);

        //             myController1.clear();
        //             myController2.clear();

        //             Navigator.of(context).pop();
        //           });
        //         }
        //       },
        //     ))
        //   ],
        // ),
        );
  }
}
