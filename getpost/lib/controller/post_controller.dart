import 'package:http/http.dart';

class PostController
{

  var url =('jsonplaceholder.typicode.com/users');
  void postData() async
  {
    final response = await post(Uri.parse(url),body:
        {
          "name":"Anything",
          "username": "Post Body",
          "email":"rubel.cse532@gmail.com"
        }
    );
    print(response.body);
  }
}