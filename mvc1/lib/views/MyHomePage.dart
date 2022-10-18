import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc1/controller/home_controller.dart';
import 'package:mvc1/model/user_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PostModel> posts=[];
  final postCtrl=PostController();

  void _getPost() async
  {
    final data=await postCtrl.getPostList();
    setState(() {
      posts=data;
    });
  }
  @override
  void initState()
  {
    super.initState();
    _getPost();
  }
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: (posts.length<1)?Text("Loading"):
          Card(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (ctx,index)
                {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("${posts[index].title}",style: TextStyle(color: Colors.teal),),
                  );
                }
            ),
          )
    );
  }
}
