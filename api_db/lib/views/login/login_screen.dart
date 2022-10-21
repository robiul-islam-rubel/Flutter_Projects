import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email="rubel.cse532@gmail.com";
  String pass="rubelcse47";
  TextEditingController emailaddress = TextEditingController();
  TextEditingController userpassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              // Login Image
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset(
                      'assets/images/login.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              //Edit Text
              SizedBox(height: 20.0),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                    controller: emailaddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Address',
                        hintText: 'Please enter email addres'),
                    validator: (val)
                    {
                      if(val==null||val.isEmpty)
                      {
                        return "Enter your email";
                      }
                      String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                      RegExp regExp = new RegExp(p);

                      if(!regExp.hasMatch(val)){
                        return "Enter valid email address";

                      }
                      return null;
                    }
                ),
              ),

              SizedBox(height: 10.0),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                    controller: userpassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Please Enter Password'),

                    validator: (val)
                    {

                      if(val==null||val.isEmpty)
                      {
                        return "Enter user password";
                      }
                      if(val!="rubelcse47")
                        {
                          return "Enter valid password";
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
                      'SignIn',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {

                      if(_formkey.currentState!.validate())
                      {
                        if(emailaddress.text.toString()==email&&userpassword.text.toString()==pass)
                          {
                            Navigator.pushNamed(context, '/LMSDashboardScreen');
                          }


                        //return Text("Login Success");
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
  bool isEmail(String em) {
    // print("Email fun called");

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
}
