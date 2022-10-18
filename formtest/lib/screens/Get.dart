import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart';
class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  final url = "https://jsonplaceholder.typicode.com/posts";
  var _getdata=[];
  void fetchData() async{
    try
        {
          final response = await get(Uri.parse(url));
          final jsonData =jsonDecode(response.body)as List;
          setState(() {
            _getdata=jsonData;
          });

        }
        catch(err)
    {
      print("Error occured");
    }
  }
  void initState(){
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _getdata.length,
      itemBuilder: (context,index)
        {
          final _get= _getdata[index];
          return Text("Title: ${_get["title"]}");
        }
    );
  }
}
