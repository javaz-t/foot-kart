import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/provider/google_sign_provider.dart';
import 'package:shoe_kart/provider/firebase_auth_provider.dart';
import 'package:shoe_kart/screens/login_page.dart';
import 'package:shoe_kart/screens/start_page.dart';
import 'package:shoe_kart/util/const.dart';
import 'package:shoe_kart/widgets/divider_text.dart';
import '../widgets/button.dart';
import '../widgets/login/sign_up.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Consumer<AuthenticationProvider>(
              builder: (context, regCtrl, child) => Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const TitleText(title: 'Create Account'),
                    const SubTitleText(
                        subTitle: 'Let\'s Create Account Together'),
                    const SizedBox(
                      height: 20,
                    ),
                    const LeftAlignText(text: 'Your Name'),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        validator: (value) {
                          String name = regCtrl.nameController.text;
                          bool isValidUsername(String username) {
                            // The username should contain only lowercase letters and digits
                            Pattern pattern = r'^[a-z0-9]+$';
                            RegExp regex = RegExp(pattern.toString());

                            // Count the number of digits in the username
                            int digitCount = username
                                .split('')
                                .where((char) => '0123456789'.contains(char))
                                .length;

                            // The username should be more than 5 characters long, contain only lowercase letters and digits,
                            // and have a maximum of 3 digits
                            return regex.hasMatch(username) &&
                                username.length > 5 &&
                                digitCount <= 3;
                          }

                          if (isValidUsername(name)) {
                            return 'User Name is Ok ';
                          } else {
                            return ' User name contain atlest 5 charactor and atmost 3 digits ';
                          }
                        },
                        controller: regCtrl.nameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '    Please enter your name ',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    kHSize20,
                    const LeftAlignText(text: 'Email Address'),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        controller: regCtrl.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          String email = regCtrl.emailController.text;
                          if (email.contains('@') && email.length > 5) {
                            return 'Entered email is Ok';
                          } else {
                            return 'Enter a vlaid email';
                          }
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '     example@gmail.com',
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
                        controller: regCtrl.passController,
                        validator: (value) {
                          String pass = regCtrl.passController.text;
                          if (pass.length > 5) {
                            return 'Strong password';
                          } else {
                            return 'Weak Password';
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: '     Please enter the password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    kHSize30,
                    Button(
                        text: 'Sign In',
                        onTabb: () {
                          if (formKey.currentState!.validate()) {
                            showMySnackBar(context, 'somethig went wrong');
                          } else {
                            regCtrl.registerUsingEmailPassword(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StartPage()),
                            );
                          }
                        }),
                    kHSize30,
                    const DividerText(
                      text: 'Or Continue with ',
                      thickness: 1,
                    ),
                    kHSize30,
                    GoogleLogIn(onTab: () async {
                      final googleProvider = Provider.of<GoogelSignInProvider>(
                          context,
                          listen: false);
                      await googleProvider.googelLogin();
                      if (googleProvider.credential != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartPage()),
                        );
                      }
                    }),
                    ButtomText(
                        text: 'Already Have An Account ?: ',
                        textButton: 'Sign In',
                        onTab: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
