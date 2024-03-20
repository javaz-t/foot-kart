import 'package:flutter/material.dart';

import 'package:shoe_kart/screens/registration_page.dart';
import 'package:shoe_kart/widgets/button.dart';
import 'package:shoe_kart/widgets/divider_text.dart';
import 'package:shoe_kart/widgets/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView (
            child: 
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TitleText(title: 'Hello Again !'),
                  SubTitleText(subTitle: 'Welcome Back you\'ve Been Missed !'),
                  SizedBox(
                    height: 20,
                  ),
                  LeftAlignText(text: 'Email Address'),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                     
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LeftAlignText(text: 'Password'),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                     
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Button(text: 'Log In', onTabb: () { }),
                  const SizedBox(
                    height: 40,
                  ),
                  DividerText(
                    text: 'Or Continue with ',
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GoogleLogIn(googelLogin: () {}),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtomText(
                      text: 'Don\'nt have An Accound ?',
                      textButton: 'Sign Up for Free',
                      onTab: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationPage()),
              );
              })
                ],
              ),
            ),
          ),
        ),
    );
  }
}
