import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  List<String>data=[
    'One','Two','Three','Four','Five','Six','Seven'

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index)
          {
            return Card(
              color: Colors.deepOrangeAccent,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListTile(
                  title: Text(data[index]),
                  trailing: Container(
                    width: 70,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                              onPressed: (){
                                showDialog(
                                  context: (context), builder: (context)=>SimpleDialog(
                                  children: [
                                    TextField(

                                    ),
                                    ElevatedButton(onPressed:(){},

                                         child: Text("Update")),


                                  ],
                                ),
                                );

                                //icon: Icon(Icons.edit),
                              }, icon:Icon(Icons.edit),
                          )
                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            data.removeAt(index);
                          });
                        }, icon: Icon(Icons.delete_outline))

                      ],

                    ),
                  ),


                ),
              ),
            );
          }

      ),
    );
  }
}
