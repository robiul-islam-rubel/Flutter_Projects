import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:offlinedb/model/mini_ayat_list.dart';
const BASE_URL = 'http://139.180.156.187:92/api/quran/';
const API_KEY = 'x-api-key';
const API_SECRET = '3R5TWxA0GAn04EQ42haCnYtFxeRlV08yMi5o';
const endpoint_surah_list = 'sura';
const endpoint_ayat = 'sura/ayats?sura_id=';
class MiniAyatProvider{

  Future<dynamic> getMiniAyat(var surahId) async {
    var client = http.Client();
    Iterable miniayatList;

    try {
      var response = await client.get(
        Uri.parse(
            "${BASE_URL + endpoint_ayat}$surahId"),
        headers: {"Accept": "application/json", "$API_KEY": "$API_SECRET"},
      );

      if (response.statusCode == 200) {
        //debugPrint(response.body.toString(),wrapWidth: 1000);
        var jsonString=(response.body);
        miniayatList=jsonDecode(jsonString);

        // toast(response.body.toString());
        return  miniayatList.map((ayat) =>miniAyat.fromJson(ayat) ).toList();

        // return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }
}