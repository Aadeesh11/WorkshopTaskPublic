import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/models/todo_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoList todoList = TodoList();
  final List<Todo> _allTodos = <Todo>[];
  List<Widget> lisWig = <Widget>[];
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget wigbody = Row(
    children: const [
      Center(
        child: Text("No Todos Added"),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Your Todos"),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
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
                                decoration: const InputDecoration(
                                    labelText: "Title", hintText: 'Title'),
                              ),
                              TextField(
                                  controller: desccontroller,
                                  decoration: const InputDecoration(
                                      labelText: "Description",
                                      hintText: 'Description')),
                              SizedBox(
                                width: 320.0,
                                child: TextButton(
                                  onPressed: () {
                                    if (titlecontroller.text.isNotEmpty &&
                                        desccontroller.text.isNotEmpty) {
                                      setState(() {
                                        Navigator.of(context).pop();
                                        wigbody = ListView(
                                          children: [
                                            GestureDetector(
                                              child: ListTile(
                                                title:
                                                    Text(titlecontroller.text),
                                                subtitle:
                                                    Text(desccontroller.text),
                                                leading: const CircleAvatar(
                                                  child: Text("1"),
                                                ),
                                              ),
                                              onDoubleTap: () {
                                                showDialog(
                                                    context: _scaffoldKey
                                                        .currentContext,
                                                    builder: (BuildContext
                                                        currentcontext) {
                                                      return AlertDialog(
                                                        content: const Text(
                                                            "Are you sure you want to delete this todo?"),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  titlecontroller
                                                                      .clear();
                                                                  desccontroller
                                                                      .clear();
                                                                  Navigator.of(
                                                                          currentcontext)
                                                                      .pop();
                                                                  wigbody = Row(
                                                                    children: const [
                                                                      Center(
                                                                        child: Text(
                                                                            "No Todos Added"),
                                                                      )
                                                                    ],
                                                                  );
                                                                });
                                                              },
                                                              child: const Text(
                                                                  "Yes")),
                                                          TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  Navigator.of(
                                                                          currentcontext)
                                                                      .pop();
                                                                });
                                                              },
                                                              child: const Text(
                                                                  "No"))
                                                        ],
                                                      );
                                                    });
                                              },
                                            )
                                          ],
                                        );
                                      });
                                    }
                                  },
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
        body: wigbody);
  }
}
