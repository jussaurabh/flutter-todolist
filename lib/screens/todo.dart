import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/theme_provider.dart';
import 'package:todolist/service/alert.service.dart';
import 'package:todolist/service/todos.service.dart';
import 'package:todolist/widgets/myappbar.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _formKey = GlobalKey<FormState>();
  final _todo = new TodoService();
  FocusNode titleFocusNode = FocusNode();
  AlertService alertService = AlertService();

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    titleFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
        appBar: MyAppbar(
            title: 'Todo form',
            prev: Text('Cancel', style: Theme.of(context).textTheme.headline6)),
        body: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: themeProvider.isDarkMode
                          ? Colors.black
                          : Colors.black12),
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: true,
                        focusNode: titleFocusNode,
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.multiline,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Title"),
                        onSaved: (newValue) {
                          setState(() {
                            if (newValue != null) {
                              _todo.todo.title = newValue;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  decoration: BoxDecoration(
                      color: themeProvider.isDarkMode
                          ? Colors.black
                          : Colors.black12),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.multiline,
                        onSaved: (newValue) {
                          setState(() {
                            if (newValue != null) {
                              _todo.todo.detail = newValue;
                            }
                          });
                        },
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Details"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: OutlinedButton(
                      onPressed: () async {
                        final form = _formKey.currentState;

                        if (form!.validate()) {
                          form.save();
                          _formKey.currentState?.reset();
                          titleFocusNode.requestFocus();
                          await _todo.save();
                          alertService.showAlertDialog(
                              context, 'todo saved', '');
                        }
                      },
                      child: Text('Add')),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: OutlinedButton(
                      onPressed: () async {
                        await _todo.reset();
                      },
                      child: Text('Reset todos')),
                ),
              ],
            ),
          ),
        ));
  }
}
