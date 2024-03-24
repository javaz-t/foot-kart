import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/provider/start_screen_provider.dart';


class StartPage extends StatelessWidget {
   const StartPage({super.key});
  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      bottomNavigationBar: Consumer<StartScreenProvider>(
        builder: (context,startCtrl,child)=>
        BottomNavigationBar(
          currentIndex: startCtrl.currentIndex,
         selectedIconTheme: const IconThemeData(
          color: Colors.deepPurple,  
        ),
        
           unselectedItemColor: Colors.grey,
          backgroundColor: Colors.deepPurpleAccent,
          iconSize: 30,
          items:  const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, ), label: "HOME"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.badge_outlined    , ),
                label: "Bag"),   
            BottomNavigationBarItem(
                icon: Icon(Icons.person, ),
                label: "Person"),
          ],
          onTap: (int newIndex) {
        
              startCtrl.getCurrentIndex(newIndex);
            
          },
        ),
      ),
      body:Consumer<StartScreenProvider>(builder: (context,startCtrl,child)=>
      startCtrl.body[startCtrl.currentIndex]),
    );
  }
}
