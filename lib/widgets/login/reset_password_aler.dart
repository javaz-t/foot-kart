import 'package:flutter/material.dart';

class ResetPasswordAlertDialog extends StatelessWidget {
  final String title;
  final String hintTextField;
  final Function onTap;
  final TextEditingController textEditingController;

  ResetPasswordAlertDialog({super.key, required this.title, required this.hintTextField, required this.onTap, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: textEditingController,
        decoration: InputDecoration(hintText: hintTextField),
      ),
      actions: <Widget>[
        TextButton(
          child:const Text('CANCEL'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child:const Text('OK'),
          onPressed: () {
           onTap();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

