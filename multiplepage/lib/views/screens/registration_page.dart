import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controllers/database/database_helper.dart';
import '../../models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key, this.contact}) : super(key: key);
  final contact;

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _mobliecontroler = TextEditingController();
  TextEditingController _emailaddress = TextEditingController();
  TextEditingController _userpassword = TextEditingController();

  final _formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset(
                      'assets/images/signup.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //Edit Text
              SizedBox(height: 20.0),
              // Login Image

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                    controller: _namecontroller,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_rounded),
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter your name'),

                    validator: (val)
                    {
                      if(val==null||val.isEmpty)
                      {
                        return "Enter user name";
                      }
                      return null;
                    }

                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                    controller: _mobliecontroler,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mobile_friendly),
                        border: OutlineInputBorder(),
                        labelText: 'Mobile',
                        hintText: 'Enter your mobile number'),

                    validator: (val)
                    {
                      if(val==null||val.isEmpty)
                      {
                        return "Enter mobile number";
                      }
                      return null;
                    }

                ),
              ),

              //Edit Text
              SizedBox(height: 20.0),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                    controller: _emailaddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(),
                        labelText: 'Email Address',
                        hintText: 'Please enter email addres'),
                    validator: (val)
                    {
                      if(val==null||val.isEmpty)
                      {
                        return "Enter your email";
                      }
                      return null;
                    }
                ),
              ),

              SizedBox(height: 10.0),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                    controller: _userpassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_rounded),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Please Enter Password'),

                    validator: (val)
                    {
                      if(val==null||val.isEmpty)
                      {
                        return "Enter user password";
                      }
                      return null;
                    }

                ),
              ),

              SizedBox(height: 20.0),

              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0)),
                child: ElevatedButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () async {
                      //toast("value");

                      if(_formkey.currentState!.validate())
                      {
                        Navigator.pushNamed(context, '/login');

                        postData();
                        //return Text("Login Success");

                        await DBHelper.createContacts(
                            Contact(
                          name: _namecontroller.text,
                          mobile: _mobliecontroler.text,
                          email: _emailaddress.text,
                          password: _userpassword.text,
                        ));




                      }
                    }

                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
  var url="https://634e48b9f34e1ed826874c92.mockapi.io/rubel/users";
  void postData() async {
    //print("Hello");
    try {
       await http.post(Uri.parse(url), body: {
        "name": _namecontroller.text,
        "mobile":_mobliecontroler.text,
        "email":_emailaddress.text,
        "password":_userpassword.text,

      }
      );
    }
    catch (err) {
      print("Error occured in post");
    }
  }
}
