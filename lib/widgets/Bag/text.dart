import 'package:flutter/material.dart';
class SizeText extends StatelessWidget {
  final String size;
  const SizeText({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      size,
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold,color: Colors.blueAccent),
    );
  }
}
