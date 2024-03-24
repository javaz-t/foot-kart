import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoe_kart/functions/store_logged_vale.dart';
import 'package:shoe_kart/screens/start_page.dart';
import 'package:shoe_kart/util/const.dart';

class AuthenticationProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  
  
  //for new users
registerUsingEmailPassword(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      user = userCredential.user;
      await user!.updateDisplayName(nameController.text);
      await user.reload();
      user = auth.currentUser;
       clearData();
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const StartPage()));
       //-----------
    setUserLoggedIn(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMySnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showMySnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      showMySnackBar(context, e.toString());
    }
   
   
  }

  //Login
  login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      clearData();
      showMySnackBar(context, 'Success');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const StartPage()));
      //===========
      setUserLoggedIn(true);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMySnackBar(context, 'No user found for that email.');
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        showMySnackBar(context, 'Wrong password provided for that user.');
        return ;
      } else {
        showMySnackBar(context, e.toString());
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  clearData() {
    emailController.clear();
    nameController.clear();
    passController.clear();
  }
}
