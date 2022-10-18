import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formtest/screens/Get.dart';
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
final _formKey = GlobalKey<FormState>();

class _MyHomePageState extends State<MyHomePage> {
  final _titlecontroller = TextEditingController();
  final _bodycontroller = TextEditingController();
  final _idcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get and Post"),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10),
                  child: TextFormField(
                      controller: _idcontroller,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.numbers),
                        hintText: 'Enter your id',
                        labelText: 'ID',

                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Can't be empty!";
                        }
                        return null;
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10),
                  child: TextFormField(
                      controller: _titlecontroller,
                      decoration: const InputDecoration(

                        icon: const Icon(Icons.title),
                        hintText: 'Enter your title',
                        labelText: 'Title',
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Can't be empty!";
                        }
                        return null;
                      }
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10),
                  child: TextFormField(
                      controller: _bodycontroller,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.accessibility_new),
                        hintText: 'Enter your body',
                        labelText: 'Body',

                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Can't be empty!";
                        }
                        return null;
                      }
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            child: Text("Post"),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                postData();
                              }
                            }
                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            child: Text("Get"),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                fetchData();
                              }
                            }
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )


    );
  }

  var _getdata = [];
  final url = "https://634e48b9f34e1ed826874c92.mockapi.io/rubel/test";

  void fetchData() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _getdata = jsonData;
      });
       _getdata.forEach((element) {
         print(element['title']);
         //print(element.toString());
       });

      //print(r);

    }
    catch (err) {
      print("Error occured");
    }
  }
  void postData() async {
    try {

       final response = await post(Uri.parse(url),body: {
         "title": _titlecontroller.text,
         "body":_bodycontroller.text ,
         "userId":_idcontroller.text
       }
       );

    }
    catch (err) {
      print("Error occured in post");
    }
  }

}

