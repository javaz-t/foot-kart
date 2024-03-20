import 'package:flutter/material.dart';

import 'package:shoe_kart/screens/login_page.dart';
class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:  3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height:double.infinity,
        width: double.infinity,child: Image.asset('assets/images/splash.png',fit: BoxFit.cover,),)
    );
  }
}
