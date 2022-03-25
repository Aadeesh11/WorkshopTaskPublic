import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/widgets/todo_list_item.dart';
import 'package:workshop_task/widgets/add_todo_dialogue.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var todoListObject = TodoList();

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
                    child: TodoListItem(
                        todo: todoListObject.allTodos()[index], index: index),
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
                  return const AddTodoDialogue();
                }).then((value) {
              setState(() {
                todoListObject.addTodo(value);
              });
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
