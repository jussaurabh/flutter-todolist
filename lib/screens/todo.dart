import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/theme_provider.dart';
import 'package:todolist/widgets/myappbar.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: MyAppbar(
          title: 'Todo form',
          prev: Text('Cancel', style: Theme.of(context).textTheme.headline6)),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color:
                    themeProvider.isDarkMode ? Colors.black : Colors.black12),
            child: TextFormField(
              cursorColor: Colors.green,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Hint here"),
            ),
          ),
        ],
      ),
    );
  }
}
