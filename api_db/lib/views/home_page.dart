import 'package:flutter/material.dart';

import '../controller/database/helper.dart';
import '../models/contacts.dart';
import 'package:http/http.dart' as http;
import 'add_contacts.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          children: [
            Text("Api with DB"),
            SizedBox(width: 50,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.tealAccent)
              ),

                child: Text("Get from DB"),
                onPressed: ()
                {
                  readContacts();
                  print("I am here");

                }

            )

          ],
        ),
      ),
      //add Future Builder to get contacts
      body: FutureBuilder<List<Contact>>(
        future: DBHelper.readContacts(), //read contacts list here
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          //if snapshot has no data yet
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Loading...'),
                ],
              ),
            );
          }
          //if snapshot return empty [], show text
          //else show contact list
          return snapshot.data!.isEmpty
              ? Center(
            child: Text('No Contact in List yet!'),
          )
              : ListView(
            children: snapshot.data!.map((contacts) {
              return Center(
                child: ListTile(
                  title: Text(contacts.name),
                  subtitle: Text(contacts.contact),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await DBHelper.deleteContacts(contacts.id!);
                      setState(() {
                        //rebuild widget after delete
                      });
                    },
                  ),
                  onTap: () async {
                    //tap on ListTile, for update
                    final refresh = await Navigator.of(context)
                        .push(MaterialPageRoute(
                        builder: (_) => AddContacts(
                          contact: Contact(
                            id: contacts.id,
                            name: contacts.name,
                            contact: contacts.contact,
                          ),
                        )));

                    if (refresh) {
                      setState(() {
                        //if return true, rebuild whole widget
                      });
                    }
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final refresh = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddContacts()));

          if (refresh) {
            setState(() {
              //if return true, rebuild whole widget
            });
          }
        },
      ),
    );
  }
  Future<List<Null>> readContacts() async {

    print("RUbel");
    var url = "https://634e48b9f34e1ed826874c92.mockapi.io/rubel/contacts";
    //final response = await https.get(Uri.parse('url'));
    final response = await http
        .get(Uri.parse(url));

    return (response.body as List).map((contact) {

      //print('Inserting $employee');
      DBHelper.createContacts(Contact.fromJson(contact));
    }).toList();

  }
}