import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:listpractice/Models/UserModel.dart';
import 'package:oktoast/oktoast.dart';

class Demo extends StatefulWidget{
  const Demo({ Key? key}): super(key: key);
  @override
  _Demo createState()=> _Demo();
}
class _Demo extends State<Demo>
{
  List<UserModel> userList=[];
  Future<List<UserModel>> getUserApi () async {
    final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data =jsonDecode(response.body);
    if(response.statusCode==200)
      {
        for (Map i in data)
          {

            userList.add(UserModel.fromJson(i));
          }

        return userList;
      }
    else
      {
        return userList;
      }
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ListViewWithAPI'),
      ),
      body: Column(
        children: [
          Expanded(
              child:FutureBuilder(
                future: getUserApi(),
                builder: (context,AsyncSnapshot<List<UserModel>> snapshot){
                  if(!snapshot.hasData)
                    {
                      return Text("Loading....");

                    }
                  else
                  {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(title: 'Name', value:  snapshot.data![index].name.toString()),
                                  ReusableRow(title: 'UserName', value:  snapshot.data![index].username.toString()),
                                  ReusableRow(title: 'Email', value:  snapshot.data![index].email.toString()),
                                  ReusableRow(title: 'Address-City',
                                      value:  snapshot.data![index].address!.city.toString()),

                                ],
                              ),
                            ),
                          );

                        }

                    );
                  }

                },




    ),

    )


        ],
      ),
    );
  }
}
class ReusableRow extends StatelessWidget {
  String title,value;
   ReusableRow({Key? key,required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(title),
        Text(value),



      ],
    );
  }
}
