import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/provider/google_sign_provider.dart';
import 'package:shoe_kart/provider/sign_up_Provider.dart';
import 'package:shoe_kart/provider/start_screen_provider.dart';
import 'package:shoe_kart/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoe_kart/screens/login_page.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
     ChangeNotifierProvider(create: (context)=>StartScreenProvider()),
     ChangeNotifierProvider(create: (context)=>GoogelSignInProvider()),
     ChangeNotifierProvider(create: (context)=>SignUpProvider())
     ],
     
      child: MaterialApp(
        theme: ThemeData(
         scaffoldBackgroundColor: Colors.grey[200],
          textTheme: GoogleFonts.fredokaTextTheme(),
        ),
        home: const LoginPage()  ),
    );
  }
}
                                                              