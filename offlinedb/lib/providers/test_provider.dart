


import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;

import '../../controllers/database/quran_database.dart';
import '../model/ayat_list.dart';
import '../model/surah_list.dart';
import 'package:offlinedb/model/modified_ayat_list.dart';
const BASE_URL = 'http://139.180.156.187:92/api/quran/';
const API_KEY = 'x-api-key';
const API_SECRET = '3R5TWxA0GAn04EQ42haCnYtFxeRlV08yMi5o';
const endpoint_surah_list = 'sura';
const endpoint_ayat = 'sura/ayats?sura_id=';
const endpoint_allayat='ayats';

class SurahApiProvider {
  Future<List<Surah>> getallSurah() async {
    //toast("I am from test_provider");
    var client = http.Client();
    Iterable surahList;
    var response = await client.get(
      Uri.parse("${BASE_URL + endpoint_surah_list}"),
      headers: {"Accept": "application/json", "$API_KEY": "$API_SECRET"},
    );

    var jsonString=(response.body);
    surahList=jsonDecode(jsonString);



    return  surahList.map((surah) =>Surah.fromJson(surah) ).toList();
  }
}

//**************************Ayat Api Provider*********************************


class AyatProvider{

  Future<dynamic> getAyatBySurah(var surahId) async {
    var client = http.Client();
    Iterable ayatList;

    try {
      var response = await client.get(
        Uri.parse(
            "${BASE_URL + endpoint_ayat}$surahId"),
        headers: {"Accept": "application/json", "$API_KEY": "$API_SECRET"},
      );

      if (response.statusCode == 200) {
      //  debugPrint(response.body.toString(),wrapWidth: 1000);
        var jsonString=(response.body);
        ayatList=jsonDecode(jsonString);

                 // toast(response.body.toString());
        return  ayatList.map((ayat) =>Ayat.fromJson(ayat) ).toList();

       // return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

  Future<dynamic> getAllAyat() async {
    var client = http.Client();
    Iterable ayatList;

    try {
      var response = await client.get(
        Uri.parse(
            "${BASE_URL + endpoint_allayat}"),
        headers: {"Accept": "application/json", "$API_KEY": "$API_SECRET"},
      );

      if (response.statusCode == 200) {
      //  debugPrint(response.body.toString(),wrapWidth: 1000);
        var jsonString=(response.body);
        ayatList=jsonDecode(jsonString);

                 // toast(response.body.toString());
        return  ayatList.map((ayat) =>modifiedAyat.fromJson(ayat) ).toList();

       // return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }

}