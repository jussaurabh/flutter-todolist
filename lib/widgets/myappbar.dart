import 'package:flutter/material.dart';
import 'package:todolist/widgets/change_theme_button.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? prev;
  final Widget? post;

  MyAppbar({Key? key, required this.title, this.prev, this.post})
      : super(key: key);

  final Size preferredSize = const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ))),
        ),
        preferredSize: Size.fromHeight(0),
      ),
      actions: [ChangeThemeButtonWidget()],
    );
  }
}
