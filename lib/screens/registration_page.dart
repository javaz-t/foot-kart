import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/sign_up.dart';
class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
            
              children: [
                SizedBox(height: 40,),
                TitleText(title: 'Create Account'),
                SubTitleText(subTitle: 'Let\'s Create Account Together'),
            SizedBox(height: 20,),
            LeftAlignText(text: 'Your Name'),
            Container(height: 50,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),),
            
            
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
                BottomText(text: 'Already Have An Account ?: ',textButton: 'Sign In', onTab: (){})
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
