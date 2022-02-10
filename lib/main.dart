import 'package:flutter/material.dart';
import 'package:workshop_task/screen/todo_screen.dart';
import 'package:workshop_task/widgets/add_todo_dialogue.dart';

void main() {
  runApp(MaterialApp(home: TodoScreen()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.

        primarySwatch: Colors.blue,
      ),
      //GO to correct screen.
    );
  }
}
