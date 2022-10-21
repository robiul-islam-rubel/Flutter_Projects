import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


import '../controller/database/helper.dart';
import '../models/contacts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';




class AddContacts extends StatefulWidget {
  AddContacts({Key? key, this.contact}) : super(key: key);
  //here i add a variable
  //it is not a required, but use this when update
  final Contact? contact;

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  //for TextField
  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailaddress = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    //when contact has data, mean is to update
    //instead of create new contact
    if (widget.contact != null) {
      _nameController.text = widget.contact!.name;
      _emailaddress.text = widget.contact!.email;


    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailaddress.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(false),
          //to prevent back button pressed without add/update
        ),
      ),
      body: Center(
        //create two text field to key in name and contact
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  inputFormatters:[FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))],
                  decoration: InputDecoration(

                    prefixIcon: Icon(Icons.account_circle_rounded),
                    labelText: "Name",
                    hintText: "Enter your name",
                      border: OutlineInputBorder()
                  ),
                  controller: _nameController,
                  validator: (val)
                    {
                      if(val==null||val.isEmpty)
                        {
                          return "Enter name";
                        }
                    }

                ),

                SizedBox(height: 20,),

                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.contacts),
                      labelText: "Email",
                      hintText: "Enter your email address",
                    border: OutlineInputBorder()
                  ),
                  controller: _emailaddress,
                    validator: (val)
                    {
                      if(val==null||val.isEmpty)
                      {
                        return "Enter email";
                      }

                    }

                ),



                SizedBox(height: 20,),


                //_buildTextField(_nameController, 'Name'),
                SizedBox(
                  height: 30,
                ),
                //_buildTextField(_contactController, 'Mobile'),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  //this button is pressed to add contact
                  onPressed: () async {
                    //if contact has data, then update existing list
                    //according to id
                    //else create a new contact
                    //postData();
                    if(_formKey.currentState!.validate()&&isEmail(_emailaddress.text.toString())) {
                    if (widget.contact != null) {
                    await DBHelper.updateContacts(Contact(
                    id: widget.contact!.id, //have to add id here
                    name: _nameController.text,
                    email: _emailaddress.text,

                    ));

                    Navigator.of(context).pop(true);
                    } else {
                    await DBHelper.createContacts(Contact(
                    name: _nameController.text,
                      email: _emailaddress.text,

                    ));

                    Navigator.of(context).pop(true);
                    }
                    }
                  },
                  child: Text("Add to Contact"),

                ),
                ElevatedButton(
                  onPressed: () async{
                    if(_formKey.currentState!.validate()&&isEmail(_emailaddress.text.toString())) {

                      postData();
                      if (widget.contact != null) {
                        await DBHelper.updateContacts(Contact(
                          id: widget.contact!.id, //have to add id here
                          name: _nameController.text,
                          email: _emailaddress.text,

                        ));

                        Navigator.of(context).pop(true);
                      } else {
                        await DBHelper.createContacts(Contact(
                          name: _nameController.text,
                          email: _emailaddress.text,

                        )
                        );

                        Navigator.of(context).pop(true);
                      }
                    }

                  },




                  child: Text("Send to API"),
                )
              ],
            ),
          ),
        ),
      ),
    );


    //build a text field method
    TextField _buildTextField(TextEditingController _controller, String hint) {
      return TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: hint,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      );
    }
  }

  var url = "https://634e48b9f34e1ed826874c92.mockapi.io/rubel/contacts";

  void postData() async {
    try {
      final response = await post(Uri.parse(url), body: {
        "name": _nameController.text,
        "email": _emailaddress.text,


      }
      );
    }
    catch (err) {
      print("Error occured in post");
    }
  }

  Future fetchData() async
  {
    try
        {
          final response =  await http.get(Uri.parse(url));
          final jsonData = jsonDecode(response.body);
          if(response.statusCode==200)
            {
             return Contact.fromJson(jsonData);
            }
        }
        catch(err)
    {
      print("Error Occured");
    }
  }
  Future<List<Null>> readContacts() async {
    //var url = "https://634e48b9f34e1ed826874c92.mockapi.io/rubel/contacts";
    //final response = await https.get(Uri.parse('url'));
    final response = await http
        .get(Uri.parse(url));

    return (response.body as List).map((contact) {

      //print('Inserting $employee');
      DBHelper.createContacts(Contact.fromJson(contact));
    }).toList();
  }
  bool isEmail(String em) {
   // print("Email fun called");

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }


}

