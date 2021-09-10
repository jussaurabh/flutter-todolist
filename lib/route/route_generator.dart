import 'package:flutter/material.dart';
import 'package:todolist/screens/home.dart';
import 'package:todolist/screens/todo.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage(title: 'Todozz'));
      case '/todo':
        return MaterialPageRoute(builder: (_) => TodoPage(title: 'Todozz'));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Text('Error page'),
      );
    });
  }
}
