import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/provider/google_sign_provider.dart';
import 'package:shoe_kart/screens/home_page.dart';
import 'package:shoe_kart/screens/registration_page.dart';
import 'package:shoe_kart/screens/start_page.dart';
import 'package:shoe_kart/util/const.dart';
import 'package:shoe_kart/widgets/button.dart';
import 'package:shoe_kart/widgets/divider_text.dart';
import 'package:shoe_kart/widgets/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView (
            child: 
              Column(
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
                     
                      decoration: const InputDecoration(
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
                  const DividerText(
                    text: 'Or Continue with ',
                    thickness: 1,
                  ),
                 kHSize30,
                  GoogleLogIn(onTab: () async {
                    final googleProvider = Provider.of<GoogelSignInProvider>(context,listen: false);
                  await  googleProvider.googelLogin();
                  if(googleProvider.credential!=null){
                    print('inside credential');
      
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const StartPage()),);
                  

                  }
                  }),
                  const SizedBox(
                    height: 40,
                  ),
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
