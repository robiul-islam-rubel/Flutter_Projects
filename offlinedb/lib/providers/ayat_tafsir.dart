import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:offlinedb/model/ayat_list.dart';
import 'package:offlinedb/model/mini_ayat_list.dart';
const BASE_URL = 'http://139.180.156.187:92/api/quran/';
const API_KEY = 'x-api-key';
const API_SECRET = '3R5TWxA0GAn04EQ42haCnYtFxeRlV08yMi5o';
const endpoint_surah_list = 'sura';
const endpoint_ayat = 'sura/ayats?sura_id=';
class AyatTafsirProvider{

  Future<dynamic> getayattafsir(var surahId) async {
    var client = http.Client();
    Iterable ayatTafsir;

    try {
      var response = await client.get(
        Uri.parse(
            "${BASE_URL + endpoint_ayat}$surahId"),
        headers: {"Accept": "application/json", "$API_KEY": "$API_SECRET"},
      );

      if (response.statusCode == 200) {
        //debugPrint(response.body.toString(),wrapWidth: 1000);
        var jsonString=(response.body);
        ayatTafsir=jsonDecode(jsonString);

        // toast(response.body.toString());
        return  ayatTafsir.map((ayattafsir) =>AyatTafsir.fromJson(ayattafsir) ).toList();

        // return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }
}