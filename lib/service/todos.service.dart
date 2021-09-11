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
    print('todo data - ${todosData}');
    todos.add(todosData);

    await prefs.setStringList(todoPrefKey, todos);
    print('saved success');
  }

  Future<List<Todo>> getTodos() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;

    List<String> todos = prefs.getStringList(todoPrefKey) ?? [];
    List<Todo> storedTodos = [];
    for (var item in todos) {
      storedTodos.add(new Todo.fromJson(jsonDecode(item)));
    }
    return storedTodos;
  }

  Future<void> reset() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(todoPrefKey, []);
  }
}
