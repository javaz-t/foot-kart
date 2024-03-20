import 'package:flutter/material.dart';
import 'package:shoe_kart/screens/accound_Pagd.dart';
import 'package:shoe_kart/screens/bag.dart';
import 'package:shoe_kart/screens/favarate.dart';
import 'package:shoe_kart/screens/home_page.dart';

class StartScreenProvider extends ChangeNotifier{
  int currentIndex = 0;
 List<Widget> body=[
      const HomePage(),
      const FavaratePage(),
      const BagPage(),
       const AccoundPage(),
       ];

  getCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  } 


}