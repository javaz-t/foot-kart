import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/provider/sign_up_Provider.dart';
import 'package:shoe_kart/screens/login_page.dart';

import '../widgets/button.dart';
import '../widgets/sign_up.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Consumer<SignUpProvider>(builder: (context,signUpctrl,child)=>
              Column(  
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const TitleText(title: 'Create Account'),
                  const SubTitleText(subTitle: 'Let\'s Create Account Together'),
                  const SizedBox(
                    height: 20,
                  ),
                  LeftAlignText(text: 'Your Name'),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
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
                      controller: signUpctrl.emailController,
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
                      controller: signUpctrl.passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Button(text: 'Sign In', onTabb: () { print('hsl'); signUpctrl.signUp();}),
                  SizedBox(
                    height: 40,
                  ),
                        
                  ButtomText(
                      text: 'Already Have An Account ?: ',
                      textButton: 'Sign In',
                      onTab: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
