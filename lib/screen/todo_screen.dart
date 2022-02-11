//import 'package:test/dart.js';
import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/models/todo_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var todoListObj = TodoList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Todos"),
      ),
      body: todoListObj.allTodos().isEmpty
          ? const Center(child: Text("No ToDo's added"))
          : ListView.builder(
              itemCount: todoListObj.allTodos().length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    title: Text(todoListObj.allTodos()[index].title),
                    subtitle: Text(todoListObj.allTodos()[index].description),
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                  ),
                  // onTap: () {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Center(
                  //           child: Text('Long Press ToDo to Delete'),
                  //           heightFactor: 1),
                  //       duration: Duration(milliseconds: 1500),
                  //     ),
                  //   );
                  // },
                  onDoubleTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  "Are you sure you want to delete this ToDo?"),
                              actions: [
                                TextButton(
                                  child: const Text("Yes"),
                                  onPressed: () {
                                    setState(() {
                                      todoListObj.deleteTodo(
                                          todoListObj.allTodos()[index]);
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                                TextButton(
                                  child: const Text("No"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Create new TODO"),
                    content: Column(mainAxisSize: MainAxisSize.min, children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(labelText: "Title"),
                      ),
                      TextField(
                        controller: descController,
                        decoration:
                            const InputDecoration(labelText: "Description"),
                      )
                    ]),
                    actions: [
                      TextButton(
                        child: const Center(child: Text("Submit")),
                        onPressed: () {
                          var task = Todo(
                              title: titleController.text,
                              description: descController.text);
                          if (task.title != "" && task.description != "") {
                            titleController.clear();
                            descController.clear();
                            //print(task.title);
                            //print(task.description);
                            setState(() {
                              todoListObj.addTodo(task);
                            });
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ));
        },
      ),
    );
  }
}
