import 'package:flutter/material.dart';

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
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller1,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: controller2,
            decoration: const InputDecoration(labelText: "Description"),
          ),
          TextButton(
            child: const Text("Submit"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
