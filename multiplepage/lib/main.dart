import 'package:flutter/material.dart';
import 'package:multiplepage/views/screens/home_page.dart';
import 'package:multiplepage/views/screens/login_page.dart';
import 'package:multiplepage/views/screens/registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/homepage',
      routes: {
        '/homepage':(context)=>HomePage(),
        '/login':(context)=>LoginPage(),
        '/registration':(context)=>Registration()
      },
      home: Registration(),
    );
  }
}


