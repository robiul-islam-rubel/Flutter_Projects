import 'package:api_db/views/add_contacts.dart';
import 'package:api_db/views/dashboard_screen.dart';
import 'package:api_db/views/home_page.dart';
import 'package:api_db/views/login/login_screen.dart';
import 'package:api_db/views/register/registration_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/registration',
      routes: {
        '/registration':(context)=>ShoppingRegisterScreen(),
        '/LoginPage':(context)=>LoginPage(),
        '/LMSDashboardScreen':(context)=>LMSDashboardScreen()
      },
      //home: LMSDashboardScreen(),
    );
  }
}


