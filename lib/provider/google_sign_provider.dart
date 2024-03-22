import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogelSignInProvider extends ChangeNotifier{
  final googelSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user=>_user!;
  String? profileUrl;
  String? UserName;
   late final credential;
  Future googelLogin()async{
    print('inside google sign in ');
    final googleUser = await googelSignIn.signIn();
    if(googleUser==null) return;
    _user=googleUser;
    final googleAuth = await googleUser.authentication;
      credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken

     );
     await FirebaseAuth.instance.signInWithCredential(credential);
     if(user!=null){
      profileUrl = user.photoUrl;
       UserName = user.displayName;

     }
     
     notifyListeners();
  }
  Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  await googelSignIn.signOut();
  print("User Signed Out");
  notifyListeners();
}
}