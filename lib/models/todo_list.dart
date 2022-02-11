import 'package:workshop_task/models/todo.dart';

class TodoList {
  final List<Todo> _allTodos = [];
  final List<Todo> _allTodos = <Todo>[];

  List<Todo> allTodos() {
    //to complete
    return _allTodos;
  }

  void addTodo(Todo todo) {
    //to add a todo
    _allTodos.add(todo);
  }

  void deleteTodo(Todo todo) {
    //to delete todo
    _allTodos.remove(todo);
  }
}
