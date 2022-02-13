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
  // final TextEditingController controller1 = TextEditingController();
  // final TextEditingController controller2 = TextEditingController();

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
              builder: (BuildContext context2) {
                return const AddTodoDialogue();
              }).then((value) {
            setState(() {
              todoList.addTodo(value);
            });
          });
        },
      ),
      body: todoList.allTodos().isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: todoList.allTodos().length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onDoubleTap: () {
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
                    child: TodoListItem(
                        todo: todoList.allTodos()[index], index: index));
              })
          : const Center(child: Text("No Todo's added")),
    );
  }
}
