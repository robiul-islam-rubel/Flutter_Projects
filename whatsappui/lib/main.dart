import 'package:flutter/material.dart';
import 'package:whatsappui/whatsapp_home.dart';

void main() {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Whatsapp',
       theme: ThemeData(
         primaryColor: Color(0xff075E54),
         accentColor: Color(0xff25D366),
       ),
       debugShowCheckedModeBanner: false,
       home: WhatsAppHome(),
     );
   }
 }
