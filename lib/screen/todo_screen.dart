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

  // final TextEditingController myController1 = TextEditingController();
  // final TextEditingController myController2 = TextEditingController();

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
              builder: (BuildContext contextadd) {
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
                                    onPressed: () {
                                      setState(() {
                                        todoList.deleteTodo(
                                            todoList.allTodos()[index]);
                                        Navigator.of(contextofdeletion).pop();
                                      });
                                    },
                                    child: const Text("Yes")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(contextofdeletion).pop();
                                    },
                                    child: const Text("No"))
                              ],
                            );
                          });
                    },
                    child: TodoListItem(
                      index: index,
                      todo: todoList.allTodos()[index],
                    ));
              })
          : widgetbody,
    );
  }
}
