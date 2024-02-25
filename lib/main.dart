import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe_kart/screens/bag.dart';
import 'package:shoe_kart/screens/login_page.dart';
import 'package:shoe_kart/screens/product_details.dart';
import 'package:shoe_kart/screens/registration_page.dart';
import 'package:shoe_kart/screens/start_page.dart';
import 'package:shoe_kart/screens/home_page.dart';
import 'package:shoe_kart/screens/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: GoogleFonts.fredokaTextTheme(),
      ),
      home: //const BagPage()
      //TextPage()
      StartPage(),
      //RegistrationPage()
     // ProductDetailsPage(),  
    );
  }
}
