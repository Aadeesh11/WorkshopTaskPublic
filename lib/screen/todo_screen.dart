import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/models/todo_list.dart';
import 'package:workshop_task/widgets/add_todo_dialogue.dart';
import 'package:workshop_task/widgets/todo_list_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController desccontroller = TextEditingController();
  Widget taskdisplay = Row(
    children: const [
      Center(
        child: Center(child: Text("Yay! No Pending Tasks")),
      )
    ],
  );
  TodoList todoList = TodoList();
  Todo content;
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        appBar: AppBar(
          title: const Text("My Tasks"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.black,
          ),
          backgroundColor: Colors.amber,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const Dialog(
                    child: AddTodoDialogue(),
                  );
                }).then((value) {
              if (value != null) {
                setState(() {
                  todoList.addTodo(value);
                  GestureDetector(onDoubleTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("DELETE TASK"),
                            content: const Text(
                                "Are you sure you want to delete this task"),
                            actions: [
                              TextButton(
                                  child: const Text("YES"),
                                  onPressed: () {
                                    todoList.deleteTodo(value);
                                    Navigator.of(context).pop();
                                  }),
                              TextButton(
                                  child: const Text("NO"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  })
                            ],
                          );
                        });
                  });
                });
              }
            });
          },
        ),
        body: todoList.allTodos().isEmpty
            ? taskdisplay
            : ListView.builder(
                itemBuilder: ((context, index) {
                  return TodoListItem(
                    index: index,
                    todo: todoList.allTodos()[index],
                  );
                }),
                itemCount: todoList.allTodos().length,
              ));
    return scaffold;
  }
}


/*

                  */
