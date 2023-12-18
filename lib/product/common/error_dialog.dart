import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ErrorDialog extends StatelessWidget {
  final String error;
  const ErrorDialog._({super.key, required this.error});

  static Future<void> show(BuildContext context, String error) {
    return showCupertinoDialog(context: context, builder: (_) => ErrorDialog._(error: error,));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(error),
      actions: [
        CupertinoDialogAction(
          child: Text("Okay"),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
