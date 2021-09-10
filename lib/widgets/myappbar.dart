import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? prev;
  final Widget? post;

  const MyAppbar({Key? key, required this.title, this.prev, this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Container(
                child: Row(
                  children: [
                    if (prev != null)
                      Align(
                        child: Expanded(
                            child: Container(child: Center(child: prev))),
                        alignment: Alignment.centerLeft,
                      )
                    else
                      Spacer(),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(color: Colors.black),
                      child: Center(
                          child: Text(title,
                              style: Theme.of(context).textTheme.headline6)),
                    )),
                    if (post != null)
                      Expanded(
                          child: Container(
                              child: Center(
                        child: post,
                      )))
                    else
                      Spacer(),
                  ],
                ),
              )),
        ));
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
