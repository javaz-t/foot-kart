import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/provider/firebase_auth_provider.dart';
import 'package:shoe_kart/screens/home_page.dart';
import 'package:shoe_kart/screens/registration_page.dart';
import 'package:shoe_kart/util/const.dart';
import 'package:shoe_kart/widgets/button.dart';
import 'package:shoe_kart/widgets/login/reset_password_aler.dart';
import 'package:shoe_kart/widgets/login/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(30.0),
          child: Consumer<AuthenticationProvider>(
            builder: (context,loginCtrl,child)=>
           Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const TitleText(title: 'Hello Again !'),
                const SubTitleText(subTitle: 'Welcome Back you\'ve Been Missed !'),
                const SizedBox(
                  height: 20,
                ),
                const LeftAlignText(text: 'Email Address'),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                   controller: loginCtrl.emailController,
                    decoration: const InputDecoration(
                     
                        border: InputBorder.none,
                        hintText: '  example@gmail.com',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                kHSize20,
                const LeftAlignText(text: 'Password'),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                   controller: loginCtrl.passController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
               
                ButtomText(onTab: (){ showDialog(context: context, builder: (context) =>
                 ResetPasswordAlertDialog(title: 'Reset Password',hintTextField: 'Enter your email ',onTap: () async {
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: loginCtrl.emailController.text);
                  loginCtrl.emailController.clear();

                 }, textEditingController: loginCtrl.emailController,));},text: 'Forgot Password ?',textButton: 'reset ',),
                kHSize30,
                Button(text: 'Log In', onTabb: () {
                  loginCtrl.login(context);
                }),
               kHSize10,
                ButtomText(
                    text: 'Don\'nt have An Accound ?',
                    textButton: 'Sign Up for Free',
                    onTab: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegistrationPage()),
            );
            })
              ],
            ),
          ),
          ),
      ),);
  }
}
