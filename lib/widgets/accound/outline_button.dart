import 'package:flutter/material.dart';

class AccoudButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTab;
  const AccoudButton(
      {super.key, required this.text, required this.icon, required this.onTab});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTab();
      },
      child: Container(
        width: (size.width / 2) - 20, // Specify the width of the container
        height: 50, // Specify the height of the container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade400, // Border color
            width: 2, // Border width
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(width: 10,),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
