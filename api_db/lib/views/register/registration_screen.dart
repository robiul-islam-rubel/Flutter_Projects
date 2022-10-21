
import 'package:api_db/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../login/login_screen.dart';

class ShoppingRegisterScreen extends StatefulWidget {
  @override
  _ShoppingRegisterScreenState createState() => _ShoppingRegisterScreenState();
}

class _ShoppingRegisterScreenState extends State<ShoppingRegisterScreen> {
  final _namecontroller =TextEditingController();
  final _emailcontroller =TextEditingController();
  final _passcontroller =TextEditingController();
  final _formkey= GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: (Text("Create an Account", style: TextStyle(fontWeight: FontWeight.bold),)


      ),
        ),
      ),
        body: SingleChildScrollView(
          child: Container(

            child: Column(
              children: <Widget>[

                Container(
                  margin: EdgeInsets.only(left: 48, right: 48, top: 40),
                  child: Text(
                    "Enter your details to create new your account",
                    softWrap: true,
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    color:Colors.redAccent,

                    )
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Container(
                    margin: EdgeInsets.only(left: 24, right: 24, top: 36),
                    child: (

                       Column(
                        children: <Widget>[
                          TextFormField(
                       inputFormatters: [ FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")), ],

                            decoration: InputDecoration(

                              hintText: "Username",
                              labelText: "Enter your name",
                              border:OutlineInputBorder(),

                              contentPadding: EdgeInsets.all(16),
                            ),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return "Enter your name";
                                      }
                                    },
                            controller: _namecontroller,
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                          SizedBox(height: 15,),

                          TextFormField(

                            decoration: InputDecoration(

                              hintText: "Email Address",
                              labelText: "Enter your email address",
                              border: OutlineInputBorder(),

                              isDense: true,
                              contentPadding: EdgeInsets.all(16),
                            ),
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
                            },

                            controller: _emailcontroller,
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 15,),

                          TextFormField(

                            decoration: InputDecoration(

                              hintText: "Your Password",
                              labelText: "Enter your password",
                              border: OutlineInputBorder(),

                              contentPadding: EdgeInsets.all(16),

                            ),

                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Enter your password";
                              }
                            },
                            controller: _passcontroller,
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: true,
                          ),

                        ],
                      )
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 24, right: 24, top: 36),
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }
                      },
                      child: Text("CONTINUE",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    )
                    ),

                ),
              ],
            ),
          ),
        ));
  }
}
