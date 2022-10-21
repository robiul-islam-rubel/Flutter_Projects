import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/user_model.dart';
class DBHelper {

  static Future<Database> initDB() async {
    print("Database created");
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'contact.db');
    //this is to create database
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //build _onCreate function
  static Future _onCreate(Database db, int version) async {


    final String sql = '''CREATE TABLE contacts(
      id INTEGER PRIMARY KEY ,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      mobile TEXT NOT NULL,
      password TEXT NOT NULL,
    )''';

    await db.execute(sql);
  }

  //build create function (insert)
  static Future<int> createContacts(Contact contact) async {

    Database db = await DBHelper.initDB();
    //create contact using insert()
    return await db.insert('contacts', contact.toJson());
  }

  //build read function
  static Future<List<Contact>> readContacts() async {
    Database db = await DBHelper.initDB();
    var contact = await db.query('contacts', orderBy: 'name');
    //this is to list out the contact list from database
    //if empty, then return empty []
    List<Contact> contactList = contact.isNotEmpty
        ? contact.map((details) => Contact.fromJson(details)).toList()
        : [];
    return contactList;
  }

  //build update function
  static Future<int> updateContacts(Contact contact) async {
    Database db = await DBHelper.initDB();

    return await db.update('contacts', contact.toJson(),
        where: 'id = ?', whereArgs: [contact.id]);
  }

  //build delete function
  static Future<int> deleteContacts(int id) async {
    Database db = await DBHelper.initDB();

    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }
}