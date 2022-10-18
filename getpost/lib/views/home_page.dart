import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getpost/controller/home_controller.dart';
import 'package:getpost/controller/post_controller.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<user> data=[];
  var _data=[];
  final url =('jsonplaceholder.typicode.com/posts');
   postData() async
  {
    var response = await http.post(Uri.parse("jsonplaceholder.typicode.com/posts"),
      body: {
        "title":"Rubel",
      }

    );
    print(response.body);

  }
  void fetchData() async
  {
    var response = await http.get(Uri.parse(url));
    final jsonData=jsonDecode(response.body) as List;
    setState(() {
      _data=jsonData;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  ListView.builder(
          itemCount:_data.length ,
          itemBuilder: (context,i)
            {
              final get = _data[i];
              return Text("Title: ${get}");
            }
        )
      )
    );

  }
}
