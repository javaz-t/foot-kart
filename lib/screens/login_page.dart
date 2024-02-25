import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:shoe_kart/widgets/button.dart';
import 'package:shoe_kart/widgets/sign_up.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(

            children: [
              SizedBox(height: 40,),
           TitleText(title: 'Hello Again !'),
           SubTitleText(subTitle: 'Welcome Back you\'ve Been Missed !'),

           SizedBox(height: 20,),
             LeftAlignText(text: 'Email Address'),
              Container(height: 50,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
              child: TextFormField(decoration: InputDecoration(border: InputBorder.none,hintText: 'example@gmail.com',hintStyle: TextStyle(color: Colors.grey)),),)
             ,SizedBox(height: 20,),
             LeftAlignText(text: 'Password'),
              Container(height: 50,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                child: TextFormField(decoration: InputDecoration(border: InputBorder.none,),),),
              SizedBox(height: 40,),
              Button(text: 'Sign In', onTab: (){}),
              SizedBox(height: 40,),
              GoogleSignIn(),
              BottomText(text: 'Don\'nt have An Accound ?', textButton: 'Sign Up for Free', onTab: (){})

            ],
          ),
        ),
      ),
    );
  }
}
