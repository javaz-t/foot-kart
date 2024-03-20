import 'package:flutter/material.dart ';
/// blue colored button
class Button extends StatelessWidget {
  final Function onTabb;
  final String text;
  const Button({super.key, required this.text, required this.onTabb,});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){onTabb();},
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration( 
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20)),
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

class GoogleLogIn extends StatelessWidget {
  final Function () googelLogin;
  const GoogleLogIn({super.key, required this.googelLogin});

  @override
  Widget build(BuildContext context) { 
    return   InkWell(
      onTap: (){googelLogin();},
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
        image: AssetImage('assets/images/google_logo.jpg'),
        fit: BoxFit.cover,
      ),
        ),
      ),
    );
  }
}