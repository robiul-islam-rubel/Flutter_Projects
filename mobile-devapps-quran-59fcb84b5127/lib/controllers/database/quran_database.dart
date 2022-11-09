

import 'dart:io';

import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/quran/ayat_list.dart';
import '../../model/quran/modified_ayat_list.dart';
import '../../model/quran/surah_list.dart';
import 'package:path/path.dart';



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
              'suraId INTEGER ,'
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
          await db.execute('CREATE TABLE AyatWordBank('
              'id INTEGER,'
              'ayat_id INTEGER,'
              'position INTEGER,'
              'wId INTEGER,'
              'name_ar TEXT,'
              'name_en TEXT,'
              'name_bn TEXT,'
              'translate_en TEXT,'
              'translate_bn TEXT,'
              'rootWordId INTEGER,'
              'rootWordNameAr TEXT,'
              'rootWordNameEn TEXT,'
              'rootWordNameBn TEXT,'
              'subRootWordId INTEGER,'
              'subRootWordNameAr TEXT,'
              'subRootWordNameEn TEXT,'
              'subRootWordNameBn TEXT'


              ')');
          await db.execute('CREATE TABLE AyatTafsir('
              'id INTEGER,'
              'ayat_id INTEGER,'
              'tafsir_en TEXT,'
              'tafsir_bn TEXT,'
              'authorId INTEGER,'
              'authorName TEXT'
              ')');
        }
    );
  }

  //**************************create modified ayat *************************************************
createmodifiedayat(List<modifiedAyat> modifiedayat) async
{
  final db=await database;
  var batch = db?.batch();
   modifiedayat.forEach((ayat) {
     batch?.insert("Ayat", ayat.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
   });
  await batch?.commit(continueOnError: true,noResult: true);

}
  Future<int?> getCount(String tbl) async {
    final db = await this.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(id) FROM $tbl'));


  }
  Future<int?> getTotalCount(String tbl) async {
    final db = await database;
    return Sqflite.firstIntValue( await db!.rawQuery('SELECT COUNT(id) FROM $tbl'));
  }

  // *****************************Insert surah on database***********************************************
  createSurah(List<Surah> surahs) async {

    final db = await database;
    var batch = db?.batch();
    surahs.forEach((surah) {
      batch?.insert("Surah", surah.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);

    });

    await batch?.commit(continueOnError: true,noResult: true);


  }



  //*************Create ayat word bank***************************
  createayatwordBank(AyatWordBank ayatwordbank) async {

    final db = await database;
    final res = await db?.insert(
        'AyatWordBank', ayatwordbank.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);

    return res;
  }
  //*************************************Create tafsir********************************
  createtafsir(AyatTafsir ayattafsir) async {

    final db = await database;
    final res = await db?.insert(
        'AyatTafsir', ayattafsir.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);

    return res;
  }




  // *******************************Delete all surahs***********************************
  Future<int?> deleteSurah() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Ayat');

    return res;
  }

//*******************get ayat*******************************
  Future<List> getAyat(int suraId) async {
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




}

