

import 'dart:io';

import 'package:nb_utils/nb_utils.dart';
import 'package:offlinedb/model/mini_ayat_list.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/ayat_list.dart';
import '../../model/surah_list.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;
import '../../providers/test_provider.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    //toast("I am in init funciton");
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'test.db');

    return await openDatabase(path, version: 1, onOpen: (db) {
      // toast("ok");

    },
        onCreate: (Database db, int version) async {
          //toast("akjlfalfja");
          await db.execute('CREATE TABLE Surah('
              'id INTEGER PRIMARY KEY,'
              'name_en TEXT,'
              'name_bn TEXT,'
              'name_ar TEXT,'
              'sura_type_en  TEXT,'
              'sura_type_bn TEXT,'
              'sura_type_ar TEXT,'
              'total_ayat_en INTEGER,'
              'total_ayat_bn TEXT,'
              'total_ayat_ar TEXT,'
              'sanenojul_en TEXT,'
              'sanenojul_bn TEXT,'
              'sanenojul_ar TEXT'
              ')');

          await db.execute('CREATE TABLE Ayat('
              'id INTEGER,'
              'name_ar TEXT,'
              'name_en TEXT,'
              'name_bn TEXT,'
              'aya_number INTEGER,'
              'verse_key TEXT,'
              'sanenojul TEXT,'
              'tafsir TEXT,'
              'sajda INTEGER,'
              'sajda_number INTEGER,'
              'ruku INTEGER,'
              'ruku_number INTEGER,'
              'suraId INTEGER  PRIMARY KEY,'
              'suraNameAr TEXT,'
              'suraNameEn TEXT,'
              'suraNameBn TEXT,'
              'paraId INTEGER,'
              'paraNameAr TEXT,'
              'paraNameEn TEXT,'
              'paraNameBn TEXT'



              ')');
          await db.execute('CREATE TABLE MiniAyat('
              'id INTEGER,'
              'name_ar TEXT,'
              'name_en TEXT,'
              'name_bn TEXT'

              ')');


        }
    );
  }

  // Insert surah on database
  createSurah(Surah surah) async {
    //toast("afkjlaf");
    //await deleteAllEmployees();
    final db = await database;
    final res = await db?.insert(
        'Surah', surah.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    //toast("aaaaa");
    return res;
  }

//*************************Insert ayat*********************************************
  createAyat(Ayat ayat) async {
    //toast("afkjlaf");
    //await deleteAllEmployees();
    final db = await database;
    final res = await db?.insert(
        'Ayat', ayat.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    //toast("aaaaa");
    return res;
  }
//****************Create mini ayat************************************
  createminiAyat(miniAyat ayat) async {
    //toast("afkjlaf");
    //await deleteAllEmployees();
    //toast("Ami mini ayat insert a");
    final db = await database;
    final res = await db?.insert(
        'MiniAyat', ayat.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    //toast("aaaaa");
    return res;
  }

  // *******************************Delete all surahs***********************************
  Future<int?> deleteSurah() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Ayat');

    return res;
  }

//*******************get ayat*******************************
  Future<List> getAyat() async {
    var db = await database;
    var list = await db?.query("Ayat");
    return list!.toList();
  }
  //*******************************all surah*********************************

  Future<List> getSurah() async {
    var db = await database;
    var list = await db?.query("Surah");
    return list!.toList();
  }
  //****************************get mini surah**********************************
  Future<List> getminiAyat() async {
    var db = await database;
    var list = await db?.query("MiniAyat");
    return list!.toList();
  }




}

