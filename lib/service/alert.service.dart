import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertService {
  showAlertDialog(BuildContext context, String title, String? content) {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: Text(title),
                content: content != null ? Text(content) : null,
                actions: [
                  CupertinoDialogAction(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: content != null ? Text(content) : null,
        ),
      );
    }
  }
}
