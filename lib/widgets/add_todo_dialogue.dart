import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';

class AddTodoDialogue extends StatefulWidget {
  const AddTodoDialogue({Key key}) : super(key: key);

  @override
  _AddTodoDialogueState createState() => _AddTodoDialogueState();
}

class _AddTodoDialogueState extends State<AddTodoDialogue> {
  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController descEditingController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
          key: _formkey,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Title:"),
                TextFormField(
                  controller: titleEditingController,
                  validator: (value) {
                    return value.isNotEmpty ? null : "Invalid Field";
                  },
                  decoration: const InputDecoration(hintText: "Enter Title!"),
                ),
                const SizedBox(height: 10.0),
                const Text("Description:"),
                TextFormField(
                  controller: descEditingController,
                  validator: (value) {
                    return value.isNotEmpty ? null : "Invalid Field";
                  },
                  decoration:
                      const InputDecoration(hintText: "Enter Description!"),
                ),
              ])),
      actions: [
        TextButton(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text("Submit"),
          ]),
          onPressed: () {
            if (_formkey.currentState.validate()) {
              var newTodo = Todo(
                  title: titleEditingController.text,
                  description: descEditingController.text);
              Navigator.pop(context, newTodo);
            }
          },
        )
      ],
    );
  }
}
