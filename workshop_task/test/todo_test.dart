import 'package:test/test.dart';
import 'package:workshop_task/models/todo.dart';
import 'package:workshop_task/models/todoList.dart';

void main() {
  group('testing todo list ', () {
    Todo todo = Todo(title: 'title', description: "description");

    var todolist = TodoList();

    test('Intial State', () {
      expect(todolist.allTodos(), []);
    });
    test('Adding a todo', () {
      todolist.addTodo(todo);
      expect(todolist.allTodos().contains(todo), true);
    });
    test('Removing a todo', () {
      Todo newTodo = Todo(title: 'ti', description: "de");
      todolist.addTodo(newTodo);
      todolist.deleteTodo(newTodo);
      expect(todolist.allTodos().contains(newTodo), false);
    });
  });
}
