import 'package:flutter/cupertino.dart';
import 'package:mvc2/controller/home_controller.dart';
import 'package:mvc2/model/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<user> data=[];
  final Cntrl=DemoController();

  void _getPosts() async
  {
    final alldata=await Cntrl.getuserList();
    setState(() {
      data=alldata;
    });
  }
  @override
  void initState()
  {
    super.initState();
    _getPosts();
  }
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: (data.length<1)? Text("Loading"):
          Card(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx,index)
                {
                  return Padding(padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text("${data[index].id}."),
                        SizedBox(width: 10,),
                        Text("${data[index].username}")
                      ],
                    ),
                  );
                }
            ),
          )
    );
  }
}
