import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoe_kart/functions/display_data.dart';
import 'package:shoe_kart/functions/store_logged_vale.dart';
import 'package:shoe_kart/provider/google_sign_provider.dart';
import 'package:shoe_kart/provider/firebase_auth_provider.dart';
import 'package:shoe_kart/provider/product_details_provider.dart';
import 'package:shoe_kart/provider/start_screen_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoe_kart/screens/login_page.dart';
import 'package:shoe_kart/screens/start_page.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
          fetchAds();
          fetchLogo();
          fetchProduct();  
    super.initState();
  }    
  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [    
     ChangeNotifierProvider(create: (context)=>StartScreenProvider()),
     ChangeNotifierProvider(create: (context)=>GoogelSignInProvider()),
     ChangeNotifierProvider(create: (context)=>AuthenticationProvider()),
     ChangeNotifierProvider(create: (context)=>ProductDetailsProvider())
  
     ],
      
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         scaffoldBackgroundColor: Colors.grey[200],
          textTheme: GoogleFonts.fredokaTextTheme(),
        ),
        home:FutureBuilder(future: isUserLoggedIn(), 
         builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return snapshot.data==true?const StartPage():const LoginPage();
            }
          }    
        },
      ),
    )
    ); 
  }
}
                                                              