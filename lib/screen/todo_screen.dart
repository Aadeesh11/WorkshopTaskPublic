import 'package:flutter/material.dart';
import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/models/todo_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var TodoListObject = TodoList();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget zeroTodos = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:[
      Center(
        child: Text("No ToDo's Added!"),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Todos"),
      ),

      body:
      ( TodoListObject.allTodos().length==0 )
      ? zeroTodos
      : ListView.builder(
          itemCount: TodoListObject.allTodos().length,
          itemBuilder: (context, index){
            return GestureDetector(
              child: ListTile(
                title: Text(TodoListObject.allTodos()[index].title),
                subtitle: Text(TodoListObject.allTodos()[index].description),
                leading: CircleAvatar(
                  child: Text("${index+1}"),
                  backgroundColor: Color(0xFF000000),
                ),
              ),
              onDoubleTap: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Do you want to DELETE this ToDo from your list?"),
                      actions: [
                        TextButton(
                          child: Text("Yes"),
                          onPressed: (){
                            setState((){
                              TodoListObject.deleteTodo(TodoListObject.allTodos()[index]);
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                        TextButton(
                          child: Text("No"),
                          onPressed: (){ Navigator.of(context).pop(); },
                        ),
                      ],
                    );
                  }
                );
              }
            );
          }
        )
        ,

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // print("Button is pressed.");
          showDialog(
            context: context,
            builder: (context){
              final TextEditingController titleEditingController = TextEditingController();
              final TextEditingController descEditingController = TextEditingController();
              return AlertDialog(
                content: Form(
                  key: _formkey,
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title:"),
                    TextFormField(
                      controller: titleEditingController,
                      validator: (value){
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Enter Title!"),
                    ),
                    SizedBox(height: 10.0),
                    Text("Description:"),
                    TextFormField(
                      controller: descEditingController,
                      validator: (value){
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Enter Description!"),
                    ),
                  ]
                )),
                actions: [
                  TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Submit"),
                      ]
                    ),
                    onPressed: (){
                      if(_formkey.currentState.validate()){
                        var newTodo = Todo(title: titleEditingController.text, description: descEditingController.text);
                        setState((){
                          TodoListObject.addTodo(newTodo);
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              );
            }
          );
        },
        child: Icon(Icons.add, size: 35)
      ),

      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF000000),
        child: Container(height: 50.0),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}