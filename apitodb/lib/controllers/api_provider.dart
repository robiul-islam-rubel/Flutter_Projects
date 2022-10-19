

import 'package:http/http.dart' as http;

import '../models/employee_model.dart';
import 'database/database_helper.dart';

class EmployeeApiProvider {
  Future<List<Null>> getAllEmployees() async {
    var url = "https://634e48b9f34e1ed826874c92.mockapi.io/rubel/contacts";
    //final response = await https.get(Uri.parse('url'));
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    return (response.body as List).map((employee) {

      //print('Inserting $employee');
      DBHelper.createContacts(Employee.fromJson(employee));
    }).toList();
  }
}