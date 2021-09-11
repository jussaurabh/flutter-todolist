import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/widgets/change_theme_button.dart';
import 'package:todolist/widgets/myappbar.dart';
import 'package:todolist/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [
    Todo('test 1', 'some detail 1'),
    Todo('test 2', 'some detail 2'),
    Todo('test 3', 'some detail 4'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
    Todo('test 4', 'some detail 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Todozz'),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return TodoItem(title: todos[index].title);
          },
          padding:
              const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 100)),
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
