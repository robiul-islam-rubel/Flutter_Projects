import 'dart:io';
import 'package:nb_utils/nb_utils.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:qrf/model/quran/surah_list.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../../model/quran/ayat_list.dart';
import '../../model/quran/test_model.dart';

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
    final path = join(documentsDirectory.path, 'quran.db');

    return await openDatabase(path, version: 1, onOpen: (db) {
     // toast("ok");

    },
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE Surah('
              'id INTEGER PRIMARY KEY,'
              'name_en TEXT,'
              'name_bn TEXT,'
              'name_ar TEXT,'
              'sura_type_en TEXT,'
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
              'id INTEGER PRIMARY KEY,'
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
              'suraId INTEGER,'
              'suraNameAr TEXT,'
              'suraNameEn TEXT,'
              'suraNameBn TEXT,'
              'paraId INTEGER,'
              'paraNameAr TEXT,'
              'paraNameEn TEXT,'
              'paraNameBn TEXT'

              ')');

        }


        );

  }

  // *****************************Insert surah on database****************************
  createSurah(Surah surah) async {

    final db = await database;
    final res = await db?.insert('Surah', surah.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);

    return res;
  }
  //*************************Insert Ayat on database***************************
  createAyat(Ayat ayat) async {
    //toast("ami create ayat a");

    final db = await database;
    final res = await db?.insert('Ayat', ayat.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);

    return res;
  }

  // *******************************Delete all surah***********************************
  Future<int?> deleteAllSurah() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Surah');

    return res;
  }

    //***********************Get-Surah***********************************************
  Future<List> getSurah() async {
    var db = await database;
    var list = await db?.query("Surah");
    return list!.toList();
  }

  //**************get Ayat***************************

  Future<List> getAyat() async {
    var db = await database;
    var list = await db?.query("Ayat");
    return list!.toList();
  }
  //**********************************************************************************
    /*var apiProvider = EmployeeApiProvider();
    final suraList=await apiProvider.getAllEmployees();
    suraList.forEach((element) {
      DBProvider.db.createEmployee(element);*/

    //return suraList;
  }

