import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    'Signin',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {

                    if(_formkey.currentState!.validate())
                      {
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
}
