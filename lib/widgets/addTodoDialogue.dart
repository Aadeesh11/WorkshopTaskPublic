import 'package:flutter/material.dart';

class AddTodoDialogue extends StatefulWidget {
  const AddTodoDialogue({Key key}) : super(key: key);

  @override
  _AddTodoDialogueState createState() => _AddTodoDialogueState();
}

class _AddTodoDialogueState extends State<AddTodoDialogue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //TODO: Take input of title. and description.
          TextField(),
          TextField(),
          TextButton(),
        ],
      ),
    );
  }
}
