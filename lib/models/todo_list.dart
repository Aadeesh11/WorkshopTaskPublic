import 'package:workshop_task/models/todo.dart';

class TodoList {
  final List<Todo> _allTodos = [];

  List<Todo> allTodos() {
    return _allTodos;
  }

  void addTodo(Todo todo) {
    _allTodos.add(todo);
  }

  void deleteTodo(Todo todo) {
    _allTodos.remove(todo);
  }
}
