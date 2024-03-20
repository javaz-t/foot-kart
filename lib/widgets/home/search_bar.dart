import 'package:flutter/material.dart';
class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
      ),
      child: const TextField(

        decoration: InputDecoration(
          prefixIcon:
          Icon(Icons.search, color: Colors.grey), // Search icon
          hintText: 'Looking for shoes...', // Placeholder text
          border: InputBorder.none, // Remove the default border
          contentPadding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 15.0), // Padding inside the TextField
        ),
      ),
    );
  }
}
