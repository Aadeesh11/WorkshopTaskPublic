import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/widgets/add_todo_dialogue.dart';
import 'package:workshop_task/widgets/todo_list_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoList todoList = TodoList();
  List<Widget> LisWig = <Widget>[];
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget wigbody = Container(
    child: Center(
      child: Text("No Todos Added"),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Your Todos"),
        ),

        //TODO: Add todo button with this icon => "+".
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextField(
                                controller: titlecontroller,
                                decoration: InputDecoration(
                                    labelText: "Title", hintText: 'Title'),
                              ),
                              TextField(
                                  controller: desccontroller,
                                  decoration: InputDecoration(
                                      labelText: "Description",
                                      hintText: 'Description')),
                              SizedBox(
                                width: 320.0,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).pop();
                                      wigbody = ListView(
                                        children: [
                                          GestureDetector(
                                            child: ListTile(
                                              title: Text(titlecontroller.text),
                                              subtitle:
                                                  Text(desccontroller.text),
                                              leading: CircleAvatar(
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
                                                      content: Text(
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
                                                                wigbody =
                                                                    Container(
                                                                  child: Center(
                                                                    child: Text(
                                                                        "No Todos Added"),
                                                                  ),
                                                                );
                                                              });
                                                            },
                                                            child: Text("Yes")),
                                                        TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                Navigator.of(
                                                                        currentcontext)
                                                                    .pop();
                                                              });
                                                            },
                                                            child: Text("No"))
                                                      ],
                                                    );
                                                  });
                                            },
                                          )
                                        ],
                                      );
                                    });
                                  },
                                  child: Text(
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
        body: //TODO: Add list view displaying all todo.
            wigbody);
  }
}
