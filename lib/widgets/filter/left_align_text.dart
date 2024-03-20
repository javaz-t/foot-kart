import 'package:flutter/material.dart';
class LeftAlignText extends StatelessWidget {
  final String text;
   final double size;
    const LeftAlignText({super.key, required this.text,  this.size=30 });

  @override
  Widget build(BuildContext context) {
    return   Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: size),
        ));
  }
}
