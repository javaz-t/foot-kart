
import 'package:flutter/material.dart';
import 'package:shoe_kart/screens/card_page.dart';
import 'package:shoe_kart/screens/favarate.dart';
import 'package:shoe_kart/screens/home_page.dart';

class DrawerEnable extends StatelessWidget {
  const DrawerEnable({super.key});

  @override
  Widget build(BuildContext context) {
    return   Drawer(
        backgroundColor: Colors.black12,
      child: ListView(
      padding: EdgeInsets.zero,
      children: [
      // Drawer header
      const DrawerHeader(
      decoration: BoxDecoration(
      color: Colors.blueAccent,
      ),
      child: Row(
      children: [
      CircleAvatar(
        radius: 50,
      backgroundImage: NetworkImage(
      "https://www.example.com/user_avatar.jpg", // Replace with your user image URL
      ),
      ),
      SizedBox(width: 16.0),
      Text(
      "User Name", // Replace with actual user name
      style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
      ],
      ),
      ),

      // Drawer items
      ListTile(
      leading: Icon(Icons.home),
    title: Text('Home'),
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage() )), // Close drawer on tap
    ),
    ListTile(
    leading: Icon(Icons.favorite),
    title: Text('Favorites'),
    onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) =>FavaratePage() )), // Close drawer on tap
    ),
    ListTile(
    leading: Icon(Icons.shopping_cart),
    title: Text('Cart'),
    onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) =>BagPage('') )),// Close drawer on tap
    ),
    ListTile(
    leading: Icon(Icons.settings),
    title: Text('Settings'),
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage() )), // Close drawer on tap
    ),
    ListTile(
    leading: Icon(Icons.logout),
    title: Text('Logout'),
    onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage() )), // Close drawer on tap
    ),
    ],
    ),
    );
  }
}