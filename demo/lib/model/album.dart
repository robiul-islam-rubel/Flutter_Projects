import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
List<Album> album=[];
Future<List<Album>> fetchAlbum() async {
   var response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    toast("This is toast");

    // If the server did return a 200 OK response,
    // then parse the JSON.
    var JsonBody=response.body;
    var JsonData=jsonDecode(JsonBody);
    for(var data in JsonData)
      {
        toast("This is toast");



        album.add(data['title']);


      }
    return album;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}