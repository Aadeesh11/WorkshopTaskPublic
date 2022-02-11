import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/widgets/todo_list_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoList todoList = TodoList();
  final List<Todo> _allTodos = <Todo>[];
  List<Widget> listWig = <Widget>[];
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffyKey = GlobalKey<ScaffoldState>();

  Widget wibody = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Center(
        child: Text("No Todos Added"),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffyKey,
        appBar: AppBar(
          title: const Text("Your Todos"),
        ),

        //TODO: Add todo button with this icon => "+".
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add_outlined,
              size: 35,
            ),
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
                                          labelText: "Title",
                                          hintText: 'Title'),
                                    ),
                                    TextField(
                                        controller: desccontroller,
                                        decoration: const InputDecoration(
                                            labelText: "Description",
                                            hintText: 'Description')),
                                    SizedBox(
                                        width: 330.0,
                                        child: TextButton(
                                            onPressed: () {
                                              if (titlecontroller
                                                      .text.isNotEmpty &&
                                                  desccontroller
                                                      .text.isNotEmpty) {
                                                setState(() {
                                                  Navigator.of(context).pop();
                                                  wibody = ListView(children: [
                                                    GestureDetector(
                                                      child: ListTile(
                                                        title: Text(
                                                            titlecontroller
                                                                .text),
                                                        subtitle: Text(
                                                            desccontroller
                                                                .text),
                                                        leading:
                                                            const CircleAvatar(
                                                          child: Text("1"),
                                                        ),
                                                      ),
                                                      onDoubleTap: () {
                                                        showDialog(
                                                            context: _scaffyKey
                                                                .currentContext,
                                                            builder: (BuildContext
                                                                currentContext) {
                                                              return AlertDialog(
                                                                content: const Text(
                                                                    "Are you sure you want to delete this Todo?"),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          titlecontroller
                                                                              .clear();
                                                                          desccontroller
                                                                              .clear();
                                                                          Navigator.of(currentContext)
                                                                              .pop();
                                                                          wibody =
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: const [
                                                                              Center(child: Text("No Todos Added"))
                                                                            ],
                                                                          );
                                                                        });
                                                                      },
                                                                      child: const Text(
                                                                          "Yes")),
                                                                  TextButton(
                                                                      onPressed:
                                                                          (() {
                                                                        Navigator.of(currentContext)
                                                                            .pop();
                                                                      }),
                                                                      child: const Text(
                                                                          "No"))
                                                                ],
                                                              );
                                                            });
                                                      },
                                                    )
                                                  ]);
                                                });
                                              }
                                            },
                                            child: const Text(
                                              "submit",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )))
                                  ],
                                ))));
                  });
            }),
        body: wibody); //TODO: Add list view displaying all todo.
  }
}
