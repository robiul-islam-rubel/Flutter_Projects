import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/database/quran_database.dart';
import '../model/ayat_list.dart';
import '../model/mini_ayat_list.dart';
import '../model/surah_list.dart';
import '../providers/mini_ayat_provider.dart';
import '../providers/test_provider.dart';
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


  void initState() {

    post_to_db();
    post_to_db_ayat();
    post_to_db_mini_ayat();
    _refreshSurah();
    _refreshAyat();

    super.initState();
  }

  void post_to_db() async {
    var apiProvider = SurahApiProvider();
    final suraList = await apiProvider.getallSurah();
    suraList.forEach((element) {
     // print(element.toJson().toString());
      DBProvider.db.createSurah(element);
    }

    );
    //***************creating ayats***************************
  }
  void post_to_db_ayat() async
  {
    var apiProvider=AyatProvider();
    final _suraList=await apiProvider.getAyatBySurah(1);
    _suraList.forEach((element) {
      //print("akjfafaj");
     //print(element.ayat_word_bank.ayat_id.toString());
      DBProvider.db.createAyat(element);
    }

    );


  }
  //*********************creating mini ayat*****************************
  void post_to_db_mini_ayat() async
  {
    var apiProvider=MiniAyatProvider();
    _miniayat=await apiProvider.getMiniAyat(1);
   //toast("Ami mini ayat a");
    toast(_miniayat.length.toString());

    _miniayat.forEach((element) {
      //toast(element.nameEn.toString());
     // print(element.nameBn.toString());
      toast(element.nameBn);
      String a=element.nameEn.toString();
      DBProvider.db.createminiAyat(a as miniAyat);
     // toast("Ami insert er pore");

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
        title: Text("offlie database"),
      ),
      body: Center(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _surah.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                margin: EdgeInsets.all(4),
              //  color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('${_surah[index].id.toString()}')),

              );
            }
        ),
      )

    );
  }
}
