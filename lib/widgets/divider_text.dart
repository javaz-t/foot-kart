import 'package:flutter/material.dart';
//horizontal line with center text
class DividerText extends StatelessWidget {
  final String text;
  final double thickness;
  const DividerText({super.key, required this.text,  this.thickness=1});

  @override
  Widget build(BuildContext context) {
    return  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Expanded(
      child: Divider(
        color: Colors.grey,
        thickness: thickness,
      ),
    ),
    Text(
      text,
      style: TextStyle(color: Colors.blueGrey),
    ),
    Expanded(
      child: Divider(
        color: Colors.grey,
        thickness: thickness,
      ),
    ),
  ],
);
  }
}