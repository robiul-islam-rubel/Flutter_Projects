import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:offlinedb/model/modified_ayat_list.dart';
import 'package:offlinedb/providers/ayat_tafsir.dart';
import 'package:offlinedb/providers/ayat_word_bank_provider.dart';
import 'package:offlinedb/views/single_surah.dart';

import '../controllers/database/quran_database.dart';
import '../model/ayat_list.dart';
import '../model/mini_ayat_list.dart';
import '../model/surah_list.dart';
import '../providers/mini_ayat_provider.dart';
import '../providers/test_provider.dart';
import '../utils/color.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


  class _HomePageState extends State<HomePage> {
  @override
  List<Surah> _surah=[];
  List<Ayat> _ayat=[];
  List<miniAyat> _miniayat=[];
  List<AyatWordBank> _ayatwordbank=[];
  List<AyatTafsir> _ayattafsir=[];
  List<modifiedAyat> _modifiedayat=[];


  void initState() {
    post_to_db();
    //post_to_db_ayat();
    //post_to_db_mini_ayat();
    //post_to_db_ayatwordbank();
    //post_to_db_ayattafsir();
    _refreshSurah();
    post_to_db_allayat();

    //_refreshAyat();

    super.initState();
  }

  void post_to_db() async {
    var apiProvider = SurahApiProvider();
    final suraList = await apiProvider.getallSurah();
    suraList.forEach((element) async {
      //print("fdlgkijfelghefil");
     // print(element.toJson().toString());
     await DBProvider.db.createSurah(element);
    }

    );
    //***************creating ayats***************************
  }
  void post_to_db_ayat() async
  {
    var apiProvider=AyatProvider();
    final _suraList=await apiProvider.getAyatBySurah(1);
    _suraList.forEach((element) {
      print(element);
     //print(element.ayat_word_bank.ayat_id.toString());
     // DBProvider.db.createAyat(element);
    }

    );
  }
  void post_to_db_allayat() async
  {
    var apiProvider=AyatProvider();
    _modifiedayat= await apiProvider.getAllAyat();
    //print(_modifiedayat.length.toString()+" rtrtrt ");
     _modifiedayat.forEach((element) async{
       await DBProvider.db.createmodifiedayat(element);



    });
    //print(_modifiedayat.length.toString()+" kbjhb ");

  }
  //*********************creating mini ayat*****************************
  void post_to_db_mini_ayat() async
  {
    var apiProvider=MiniAyatProvider();
    _miniayat=await apiProvider.getMiniAyat(108);
   //toast("Ami mini ayat a");
    toast("Total Ayats are : "+_miniayat.length.toString());

    _miniayat.forEach((element) {
      //toast(element.nameEn.toString());
     // print(element.nameBn.toString());
      toast(element.nameEn);
      String a=element.nameEn.toString();
      DBProvider.db.createminiAyat(a as miniAyat);
     // toast("Ami insert er pore");

    });

  }
  //********************************creating ayat word bank**************************************

  void post_to_db_ayatwordbank() async
  {
    var apiProvider=AyatWordBankProvider();
    _ayatwordbank= await apiProvider.getayatwordbank(1);
    _ayatwordbank.forEach((element) {
      DBProvider.db.createayatwordBank(element);

    });
  }
  //***********************create ayat tafsir***********************
  void post_to_db_ayattafsir() async
  {
    var apiProvider=AyatTafsirProvider();
    _ayattafsir= await apiProvider.getayattafsir(108);
    _ayattafsir.forEach((element) {
      DBProvider.db.createtafsir(element);
    });

  }


  void _refreshSurah() async
  {
    DBProvider.db.getSurah().then((value){
      value.forEach((element) {
        setState(() {
          _surah.add(Surah.fromJson(element));
          //print(_surah.length.toString());
        });
      });
     // print(_surah.length.toString());

    });
  //  toast(_surah.length.toString());

  }

  //***************Ayat**************************
  void _refreshAyat() async
  {
    DBProvider.db.getAyat().then((value){
      value.forEach((element) {
        setState(() {
          _ayat.add(Ayat.fromJson(element));
          //print(_ayat.length.toString());
        });
      });
      // print(_surah.length.toString());

    });
    //  toast(_surah.length.toString());

  }


    @override

  //return suraList;


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("offline database"),
      ),
      body:Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/app_bg.png'), fit: BoxFit.cover),
            ),
          ),
          Column(
            children: [

              /* Container(
                  height: 40.0,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Al Quran'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), */
              Container(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Container(
                      height: 40.0,
                      width: 160.0,
                      child: TextFormField(
                        // controller: controller.suraNameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(fontSize: 12.0, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Surah Name",
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            labelStyle: TextStyle(color: black, fontSize: 15.0, fontWeight: FontWeight.normal),
                            hintStyle: TextStyle(color: black, fontSize: 15.0, fontWeight: FontWeight.normal),
                            filled: true,
                            fillColor: Colors.grey[400],
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: surahBgColor, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: surahBgColor, width: 0.0),
                            ),
                          )),
                    ),
                    Container(
                      height: 40.0,
                      width: 160.0,
                      child: TextFormField(
                        // controller: controller.ayatNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(fontSize: 12.0, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Ayat Number",
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            labelStyle: TextStyle(color: black, fontSize: 15.0, fontWeight: FontWeight.normal),
                            hintStyle: TextStyle(color: black, fontSize: 15.0, fontWeight: FontWeight.normal),
                            filled: true,
                            fillColor: Colors.grey[400],
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: surahBgColor, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: surahBgColor, width: 0.0),
                            ),
                          )),
                    ),
                    InkWell(
                      /* onTap: () {
                            var keyword = controller.suraNameController.text;
                            if (keyword.isEmptyOrNull) {
                              toast('Please enter a keyword');
                              return;
                            }
                            //controller.suraNameController.clear();
                            //controller.ayatNumberController.clear();
                            *//*Get.toNamed(AppPages.getAyatSearchRoute(), arguments: [
                              {"keyword": keyword}
                            ]);*//*
                          },*/
                        child: Image.asset('assets/images/search_icon.png')),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                      itemCount: _surah.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        //String lang = Get.locale.toString();
                        var surah=_surah[index];
                        // var surah = controller.surahList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  SingleSurah(surahDetails: _surah[index],)),
                            );
                            /*Get.toNamed(
                              AppPages.getAyatRoute(),
                              arguments: [
                                {"surah_id": "${surah.id}"},
                                {"total_ayat_en": surah.totalAyatEn},
                                {"total_ayat_bn": surah.totalAyatBn},
                                {"total_ayat_ar": surah.totalAyatAr},
                                {"surah_type_en": surah.suraTypeEn},
                                {"surah_type_bn": surah.suraTypeBn},
                                {"surah_type_ar": surah.suraTypeAr},
                                {"surah_list": _surah},

                              ],
                            );*/
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              color: surahBgColor,
                              height: 50.0,
                              child: Row(
                                children: <Widget>[
                                  15.width,
                                  Container(
                                      width: 40.0,
                                      child: Text(
                                        '${index + 1}',
                                        style: TextStyle(fontSize: 17.0),
                                      )),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${surah.nameEn}'),
                                        /*  '${lang == 'en' ? surah.nameEn : lang == 'bn' ? surah.nameBn : surah.nameAr}',
                                          style: TextStyle(fontSize: 17.0),
                                        ),*/
                                        Html(
                                          data: '${surah.nameAr}',
                                          shrinkWrap: true,
                                          style: {
                                            "p": Style(
                                                //padding: EdgeInsets.only(right: 12.0),
                                                fontFamily: 'Quran Font',
                                                wordSpacing: 5,
                                                fontWeight: FontWeight.bold,
                                                fontSize: FontSize.rem(1.2),
                                                textAlign: TextAlign.right,
                                                whiteSpace: WhiteSpace.NORMAL,
                                                display: Display.BLOCK)
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  15.width,
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),

            ],
          ),
        ],
      ),);
  }
}
