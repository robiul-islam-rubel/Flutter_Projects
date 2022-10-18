import 'dart:convert';

import 'package:mvc2/model/user_model.dart';
import 'package:http/http.dart' as http;

class DemoController {
  Future<List<user>> getuserList() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');

    final response = await http.get(url);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List<user> list = [];

    List<dynamic> data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) list.add(user.fromJson(data[i]));

    return list;
  }
}