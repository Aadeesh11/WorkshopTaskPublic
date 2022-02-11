import 'package:flutter/material.dart';
import 'package:workshop_task/screen/todo_screen.dart';

void main() {
  runApp(const MaterialApp(home: TodoScreen()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
