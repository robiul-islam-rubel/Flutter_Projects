import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplepage/views/screens/registration_page.dart';

import '../../controllers/database/database_helper.dart';
import '../../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                //child: Text("Welcome"),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 50.0,bottom: 200),
              child: ElevatedButton(
                child: Text("Go to SignUp"),
                onPressed: ()
                  {
                    Navigator.pushNamed(context, '/registration');

                  }
              ),
            ),
            FutureBuilder<List<Contact>>(
              future: DBHelper.readContacts(), //read contacts list here
              builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
                //if snapshot has no data yet
                if (!snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Loading...'),
                    ],
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
                        subtitle: Text(contacts.email),
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
                              builder: (_) => Registration(
                                contact: Contact(
                                  id: contacts.id,
                                  name: contacts.name,
                                  mobile: contacts.mobile,
                                  email:contacts.email,
                                  password: contacts.password
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

          ],

        ),
      ),
    );
  }
}
