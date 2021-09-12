import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/model/todo.dart';

class TodoService {
  static final String todoPrefKey = 'todos';

  Todo todo = new Todo('', '');

  Future<void> save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> todos = prefs.getStringList(todoPrefKey) ?? [];

    String todosData = jsonEncode(this.todo);
    todos.add(todosData);

    await prefs.setStringList(todoPrefKey, todos);
  }

  Future<List<Todo>> getTodos() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;

    List<String> todos = prefs.getStringList(todoPrefKey) ?? [];
    List<Todo> storedTodos = [];
    todos.forEach((element) {
      storedTodos.add(new Todo.fromJson(jsonDecode(element)));
    });
    return storedTodos;
  }

  Future<void> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(todoPrefKey, []);
  }
}
