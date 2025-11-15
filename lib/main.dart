import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:post_app/featuers/posts/view/home_view_pgae.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
// this is test 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomeViewPage());
  }
}
