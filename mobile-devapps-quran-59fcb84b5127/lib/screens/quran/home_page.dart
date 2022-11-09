import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qrf/screens/quran/single_surah.dart';
import 'package:qrf/screens/quran/test_screen.dart';
import '../../controllers/database/quran_database.dart';
import '../../model/quran/ayat_list.dart';
import '../../model/quran/modified_ayat_list.dart';
import '../../model/quran/surah_list.dart';
import '../../utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  List<Surah> _surah=[];
  List<Ayat> _ayat=[];
  List<AyatWordBank> _ayatwordbank=[];
  List<AyatTafsir> _ayattafsir=[];
  List<modifiedAyat> _modifiedayat=[];


  void initState() {
    _refreshSurah();
    super.initState();
  }
  void _refreshSurah() async
  {
    await DBProvider.db.getSurah().then((value){
      value.forEach((element) {
        setState(() {
          _surah.add(Surah.fromJson(element));
        });
      });


    });
    print(_surah.length);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          children: [
            Text("offline database")

          ],
        )
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

                        var surah=_surah[index];
                        //print("Total surah: "+surah.toString());
                       // print("Index :"+index.toString());

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>SingleSurah(surahDetails: _surah[index],)),
                            );
                            //SingleSurah(surahDetails: _surah[index],)

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
                      }
                      ),
                ),
              ),

            ],
          ),
        ],
      ),);
  }
}
