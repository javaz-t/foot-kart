
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setUserLoggedIn(bool isLoggedIn) async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
 await prefs.setBool('isLoggedIn', isLoggedIn);
}
Future<bool> isUserLoggedIn() async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
 return prefs.getBool('isLoggedIn') ?? false;
}

