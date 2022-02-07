import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/widgets/todo_list_item.dart';
import 'package:workshop_task/widgets/add_todo_dialogue.dart';

class TodoList {
  final List<Todo> _allTodos = <Todo>[];

  List<Todo> allTodos() {
    //TODO:Add logic to complete
    return _allTodos;
  }

  void addTodo(Todo todo) {
    //TODO:Add logic to add a todo
    _allTodos.add(todo);
  }

  void deleteTodo(Todo todo) {
    //TODO:Add logic to delete todo
    _allTodos.remove(todo);
  }
}
