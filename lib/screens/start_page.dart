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

    List<Widget> body=[
      HomePage(),
      FavaratePage(),
      BagPage(),
      AccoundPage(),


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
