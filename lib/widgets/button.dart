import 'package:flutter/material.dart ';
class Button extends StatelessWidget {
  final Function onTab;
  final String text;
  const Button({super.key, required this.text, required this.onTab,});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){onTab();},
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            'Sign In with google',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20 ,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
