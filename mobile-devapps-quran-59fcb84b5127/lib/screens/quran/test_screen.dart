import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qrf/controllers/ayat_controller.dart';
import 'package:qrf/controllers/test_controller.dart';
import 'package:qrf/model/quran/surah_list.dart';
import 'package:qrf/routes/app_pages.dart';
import 'package:qrf/screens/dialogs/details_dialog.dart';
import 'package:qrf/screens/dialogs/tafsir_dialog.dart';
import 'package:qrf/utils/color.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qrf/utils/widgets.dart';
import 'package:html/parser.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qrf/controllers/surah_controller.dart';
import 'package:qrf/screens/quran/test_screen.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/rendering.dart';

import 'package:qrf/screens/quran/ayat_screen.dart';
import 'package:http/http.dart' as http;

class TestScreen extends GetView<TestController> {
  void onInit()
  {
    getallAyat();

  }
  @override
  Widget build(BuildContext context) {


    bool IsLoading=false;



    return Scaffold(

        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),

        body: Stack(
          children: <Widget>[
            new Container(
              height: 800,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/images/home_bg.png"), fit: BoxFit.cover,),
              ),
            ),
            Center(
              child: Container(
                child:  IsLoading ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(list.toString()),
                    Text("Testttt")
                    /*ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, i) {
                        return  Text(list.length.toString());
                      },*/

                    ]



                ),


    ),
            )
              ]
              )
    );




  }
  Future<List<String>?> getallAyat() async {
    List<String> list=[];


    //toast("First "+list.length.toString() );
    var endpointUrl = 'http://139.180.156.187:92/api/quran/sura/ayat';
    var client = http.Client();
    Iterable surahList;

    Map<String, String> header = {
      'x-api-key': "3R5TWxA0GAn04EQ42haCnYtFxeRlV08yMi5o",
    };
    Map<String, dynamic> queryParams = {
      'sura_id': controller.surahId,
      'ayat_no': controller.ayatnum
    };
    Uri uri = Uri.parse(endpointUrl);
    final finalUri = uri.replace(queryParameters: queryParams);
   // print(finalUri);
    final response = await client.get((finalUri), headers: header);
    // print(response.body);
    // toast(response.statusCode.toString());
    var JsonData=jsonDecode(response.body);
    /* print(JsonData['name_bn']);
    print(JsonData['name_ar']);
    print(JsonData['name_en']);*/

    list.add(JsonData['name_bn']);
    list.add(JsonData['name_ar']);
    list.add(JsonData['name_en']);
    // toast("This fun is called");
    //toast(list.length.toString());
    //toast("List value : "+list.toString());
    //toast("List Length: "+list.length.toString());


     print(list[0].toString());
    print(list[1].toString());
    print(list[2].toString());

  }
/*
  Future<List<Surah>> rubel() async
  {
    Map<String, dynamic> queryParams = {
      'sura_id': controller.surahId,
      'ayat_no': controller.ayatnum
    };

    Map<String, String> header = {
      'x-api-key': "3R5TWxA0GAn04EQ42haCnYtFxeRlV08yMi5o",
    };

    Uri uri = Uri.parse(endpointUrl);
    final finalUri = uri.replace(queryParameters: queryParams);
    print(finalUri);

    final response = await http.get(finalUri, headers: header);
    final JsonData = jsonDecode(response.body);
    print(JsonData);


    List<Surah> list = [];
    for (var data in JsonData) {
      toast("Hello");

      Surah surah = Surah(
          nameEn: data["nameEn"],
          nameBn: data["nameBn"],
          nameAr: data["nameAr"]
      );
      list.add(surah);
    }
    return list;
  }*/


  }





