import 'package:flutter/material.dart';
import 'package:shoe_kart/screens/accound.dart';
import 'package:shoe_kart/screens/card_page.dart';
import 'package:shoe_kart/screens/favarate.dart';
import 'package:shoe_kart/screens/home_page.dart';

class StartScreenProvider extends ChangeNotifier{
  int currentIndex = 0;
 List<Widget> body=[
      const HomePage(),
      const FavaratePage(),
       BagPage(''),
       const Accound(),
       ];

  getCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  } 


}