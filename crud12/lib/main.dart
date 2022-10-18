// main.dart
import 'package:crud12/views/pages/MyHomePage.dart';
import 'package:crud12/views/pages/Post.dart';
import 'package:flutter/material.dart';
import 'package:crud12/database/database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'RightBrainSolution',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePage()
    );
  }
}
/*
  TextFormField(
                   // key: _formkey,
                    controller: titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                    validator: (val)
                      {
                        if(val==null||val.isEmpty)
                          {
                            return "Enter title";
                          }

                        return null;

                      }
                  ),
 */
