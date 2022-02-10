import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/models/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TodoList todoList = TodoList();

  Widget wigbody = Row(
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
      appBar: AppBar(
        title: const Text("Your Todos"),
      ),
      // ignore: todo
      //TODO: Add todo button with this icon => "+".
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: SizedBox(
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextField(
                                  controller: controller1,
                                  decoration:
                                      const InputDecoration(labelText: "Title"),
                                ),
                                TextField(
                                  controller: controller2,
                                  decoration: const InputDecoration(
                                      labelText: "Description"),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                    child: TextButton(
                                  child: const Text("SUBMIT"),
                                  onPressed: () {
                                    if (controller1.text.isNotEmpty &&
                                        controller2.text.isNotEmpty) {
                                      setState(() {
                                        String title = controller1.text;
                                        String description = controller2.text;

                                        Todo newTodo = Todo(
                                            title: title,
                                            description: description);

                                        todoList.addTodo(newTodo);

                                        controller1.clear();
                                        controller2.clear();

                                        Navigator.of(context).pop();
                                      });
                                    }
                                  },
                                ))
                              ],
                            ))));
              });
        },
      ),
      body: //TODO: Add list view displaying all todo.
          todoList.allTodos().isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: todoList.allTodos().length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(todoList.allTodos()[index].title,
                          style: const TextStyle(fontSize: 18.0)),
                      subtitle: Text(todoList.allTodos()[index].description),
                      leading: CircleAvatar(child: Text("${index + 1}")),
                      onTap: () {
                        const snackBar =
                            SnackBar(content: Text("Long Press to Delete!!"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context_) {
                              return AlertDialog(
                                content: const Text(
                                    "Are you sure you want to delete this Todo?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          todoList.deleteTodo(
                                              todoList.allTodos()[index]);
                                          Navigator.of(context_).pop();
                                        });
                                      },
                                      child: const Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context_).pop();
                                      },
                                      child: const Text("No"))
                                ],
                              );
                            });
                      },
                    );
                  })
              : const Center(child: Text("No Todo's added")),
    );
  }
}
