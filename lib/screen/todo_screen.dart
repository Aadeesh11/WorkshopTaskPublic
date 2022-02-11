import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/models/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoList todoList = TodoList();

  final TextEditingController myController1 = TextEditingController();
  final TextEditingController myController2 = TextEditingController();

  Widget widgetbody = Row(
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: SizedBox(
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextField(
                                  controller: myController1,
                                  decoration:
                                      const InputDecoration(labelText: "Title"),
                                ),
                                TextField(
                                  controller: myController2,
                                  decoration: const InputDecoration(
                                      labelText: "Description"),
                                ),
                                const SizedBox(height: 18),
                                SizedBox(
                                    child: TextButton(
                                  child: const Text("Submit"),
                                  onPressed: () {
                                    if (myController1.text.isNotEmpty &&
                                        myController2.text.isNotEmpty) {
                                      setState(() {
                                        String title = myController1.text;
                                        String description = myController2.text;

                                        Todo newTodo = Todo(
                                            title: title,
                                            description: description);

                                        todoList.addTodo(newTodo);

                                        myController1.clear();
                                        myController2.clear();

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
      body: todoList.allTodos().isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: todoList.allTodos().length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onDoubleTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext contextofdeletion) {
                            return AlertDialog(
                              content: const Text(
                                  "Are you sure you want to delete this Todo?"),
                              actions: [
                                TextButton(
                                    child: const Text("Yes"),
                                    onPressed: () {
                                      setState(() {
                                        todoList.deleteTodo(
                                            todoList.allTodos()[index]);
                                        Navigator.of(contextofdeletion).pop();
                                      });
                                    }),
                                TextButton(
                                    child: const Text("No"),
                                    onPressed: () {
                                      Navigator.of(contextofdeletion).pop();
                                    })
                              ],
                            );
                          });
                    },
                    child: ListTile(
                      title: Text(todoList.allTodos()[index].title,
                          style: const TextStyle(fontSize: 20.0)),
                      subtitle: Text(todoList.allTodos()[index].description),
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                        backgroundColor: Colors.black,
                      ),
                    ));
              })
          : const Center(child: Text("No Todo's added")),
    );
  }
}
