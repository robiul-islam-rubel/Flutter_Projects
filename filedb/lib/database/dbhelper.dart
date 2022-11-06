import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/model.dart';



class DBHelper {
  static Database?_db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
     print("Database");
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "employee.db");
    bool dbExists = await io.File(path).exists();

    if (!dbExists) {

      ByteData data = await rootBundle.load(join("assets", "employee.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(path).writeAsBytes(bytes, flush: true);
    }

    var theDb = await openDatabase(path,version: 1);
    return theDb;
  }
  createEmployee(Employee newEmployee) async {
    await deleteAllEmployees();
    final database = await db;
    final res = await database?.insert('Employee', newEmployee.toJson());

    return res;
  }
  // delete all
  Future<int?> deleteAllEmployees() async {
    final database = await db;
    final res = await database?.rawDelete('DELETE FROM Employee');

    return res;
  }
/// getting data from db
  Future<List<Employee>> getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM Employee');
    List<Employee> employees = [];
    for (int i = 0; i < list.length; i++) {
      employees.add(new Employee(list[i]["First_Name"], list[i]["Last_Name"]));
    }
    return employees;
  }
}