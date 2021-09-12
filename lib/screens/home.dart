import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/service/todos.service.dart';
import 'package:todolist/widgets/myappbar.dart';
import 'package:todolist/widgets/todo_item.dart';
import 'package:todolist/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todo = new TodoService();

  Future<List<Todo>> _getTodos() async {
    List<Todo> todos = await _todo.getTodos();
    return todos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Todozz'),
      body: FutureBuilder(
        future: _getTodos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(child: Text('Loading'));
          } else if (snapshot.data.length == 0) {
            return Container(child: Text('no todos found'));
          } else {
            return TodoList(todos: snapshot.data);
          }
        },
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black,
              blurRadius: 20,
              spreadRadius: -10,
              offset: Offset.fromDirection(10, 0))
        ], shape: BoxShape.circle),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/todo');
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          elevation: 0.0,
          splashColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
