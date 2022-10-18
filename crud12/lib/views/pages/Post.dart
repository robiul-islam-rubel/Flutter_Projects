import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url =('jsonplaceholder.typicode.com/posts');
  void postData() async
  {
    //print("Rubel");

    try {
      final response = await post(Uri.parse(url), body: {

        "title": "Anything",
        "body": "Rbs",
        "userId": 1

      }

      );

      print(response.body);

    }
    catch(er)
    {

    }


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: postData,
              child:
              Text("send post"),
            ),
          ),

        )
    );

  }
}
