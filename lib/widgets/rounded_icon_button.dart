import 'package:flutter/material.dart';
class RoundedIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  const RoundedIconButton({super.key, required this.iconData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(iconData),
      ),
    );
  }
}
