import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/models/todo_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var todoListObject = TodoList();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget zeroTodos = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Center(
        child: Text("No ToDo's Added!"),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Todos"),
      ),
      body: (todoListObject.allTodos().isEmpty)
          ? zeroTodos
          : ListView.builder(
              itemCount: todoListObject.allTodos().length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    child: ListTile(
                      title: Text(todoListObject.allTodos()[index].title),
                      subtitle:
                          Text(todoListObject.allTodos()[index].description),
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                        backgroundColor: const Color(0xFF000000),
                      ),
                    ),
                    onDoubleTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  "Do you want to DELETE this ToDo from your list?"),
                              actions: [
                                TextButton(
                                  child: const Text("Yes"),
                                  onPressed: () {
                                    setState(() {
                                      todoListObject.deleteTodo(
                                          todoListObject.allTodos()[index]);
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                                TextButton(
                                  child: const Text("No"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    });
              }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // print("Button is pressed.");
            showDialog(
                context: context,
                builder: (context) {
                  final TextEditingController titleEditingController =
                      TextEditingController();
                  final TextEditingController descEditingController =
                      TextEditingController();
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
                                  return value.isNotEmpty
                                      ? null
                                      : "Invalid Field";
                                },
                                decoration: const InputDecoration(
                                    hintText: "Enter Title!"),
                              ),
                              const SizedBox(height: 10.0),
                              const Text("Description:"),
                              TextFormField(
                                controller: descEditingController,
                                validator: (value) {
                                  return value.isNotEmpty
                                      ? null
                                      : "Invalid Field";
                                },
                                decoration: const InputDecoration(
                                    hintText: "Enter Description!"),
                              ),
                            ])),
                    actions: [
                      TextButton(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Submit"),
                            ]),
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            var newTodo = Todo(
                                title: titleEditingController.text,
                                description: descEditingController.text);
                            setState(() {
                              todoListObject.addTodo(newTodo);
                            });
                            Navigator.of(context).pop();
                          }
                        },
                      )
                    ],
                  );
                });
          },
          child: const Icon(Icons.add, size: 35)),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF000000),
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
