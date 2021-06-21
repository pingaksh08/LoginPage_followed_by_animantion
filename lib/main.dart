//animation basics
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'logoanimation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loginpage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login' : (context) => Loginpage(),
        '/logo' : (context) => FirstApp(),
        
      },
      
    );
  }
}
























































