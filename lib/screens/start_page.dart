import 'package:flutter/material.dart';
import 'package:shoe_kart/screens/accounds.dart';
import 'package:shoe_kart/screens/bag.dart';
import 'package:shoe_kart/screens/favarate.dart';
import 'package:shoe_kart/screens/home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    List<Widget> body=[
      HomePage(),
      FavaratePage(),
      BagPage(),
      Drawer(

        backgroundColor: Colors.black12,
      child: ListView(
      padding: EdgeInsets.zero,
      children: [
      // Drawer header
      DrawerHeader(
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
    onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context) =>BagPage() )),// Close drawer on tap
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
    )


    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
         unselectedItemColor: Colors.grey,
        backgroundColor: Colors.deepPurpleAccent,
        iconSize: 30,
        items:  [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blueAccent), label: "HOME"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.blueAccent),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag, color: Colors.blueAccent),
              label: "Bag"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.blueAccent),
              label: "Person"),
        ],
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;

          });
        },
      ),
      body: body[_currentIndex],
    );
  }
}
