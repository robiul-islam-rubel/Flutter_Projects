import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:apitodb/models/employee_model.dart';

  //import these

class DBHelper {

  static Future<Database> initDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'employee.db');
    //this is to create database
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future _onCreate(Database db, int version) async {

    final sql = '''CREATE TABLE employee(
      id INTEGER PRIMARY KEY,
      firstName TEXT,
      lastName TEXT,
      email TEXT,
      contact TEXT,
    )''';
    await db.execute(sql);
  }

  //build create function (insert)
  static Future<int> createContacts(Employee employee) async {
    Database db = await DBHelper.initDB();
    //create contact using insert()
    return await db.insert('employee', employee.toJson());
  }

  //build read function
  static Future<List<Employee>> readContacts() async {
    Database db = await DBHelper.initDB();
    var employee = await db.query('employee', orderBy: 'firstName');
    //this is to list out the contact list from database
    //if empty, then return empty []
    List<Employee> contactList = employee.isNotEmpty
        ? employee.map((details) => Employee.fromJson(details)).toList()
        : [];
    return contactList;
  }

  //build update function
  static Future<int> updateContacts(Employee employee) async {
    Database db = await DBHelper.initDB();
    //update the existing contact
    //according to its id
    return await db.update('employee', employee.toJson(),
        where: 'id = ?', whereArgs: [employee.id]);
  }

  //build delete function
  static Future<int> deleteEmployee(int id) async {
    Database db = await DBHelper.initDB();
    //delete existing contact
    //according to its id
    return await db.delete('employee', where: 'id = ?', whereArgs: [id]);
  }
}