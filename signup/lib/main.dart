
import 'package:flutter/material.dart';

import 'login.dart';
import 'registar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login':(context)=>const MyLogin(),
      'registar' :(context)=>const MyRegister()
    },

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


    );
  }
}








