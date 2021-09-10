import 'package:flutter/material.dart';
import 'package:todolist/widgets/myappbar.dart';

class TodoPage extends StatefulWidget {
  final String title;
  TodoPage({Key? key, required this.title}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
          title: widget.title,
          prev: Text('Cancel', style: Theme.of(context).textTheme.headline6)),
      body: Container(
        child: Text('toto form page'),
      ),
    );
  }
}
