import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:offlinedb/model/surah_list.dart';
import 'package:html/parser.dart';
import 'package:offlinedb/controllers/database/quran_database.dart';


import '../model/modified_ayat_list.dart';
import '../utils/color.dart';
import 'package:flutter_html/html_parser.dart';

class SingleSurah extends StatefulWidget {
  final Surah surahDetails;

  const SingleSurah({Key? key, required this.surahDetails}) : super(key: key);

  @override
  State<SingleSurah> createState() => _SingleSurahState();
}

class _SingleSurahState extends State<SingleSurah> {
  List<modifiedAyat> _ayat=[];
  @override
  void initState() {
   getallAyat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          children: [
            Text("A"),

          ],
        )
      ),
      body:  Stack(
        children: [

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/app_bg.png'),
                  fit: BoxFit.cover),
            ),
          ),

          Column(
            children: [


              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/player_bg.png'),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[

                              InkWell(
                                onTap: () {



                                },
                                child: Image.asset(
                                    'assets/images/player_back_forward_icon.png'),
                              ),
                              Stack(
                                children: [

                                ],
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: Image.asset(
                                    'assets/images/player_fast_forward_icon.png'),
                              ),
                              /* Image.asset(
                                            'assets/images/player_expand_icon.png'), */
                            ],
                          ),
                          Positioned(
                            top: 3,
                            right: 3,
                            child: InkWell(
                              onTap: () {

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                height: 35.0,
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(),
                    Container(
                      /*margin: EdgeInsets.only(top: controller.isVisiblePlayBg
                          ? 100.0
                          : 0.0),*/
                      child: Column(
                        children: [

                          Expanded(
                            child:
                             /* controller.isLoading.value
                                  ? Center(child: CircularProgressIndicator())
                                  : SingleChildScrollView(
                                controller: controller.scrollController,*/
                                  SingleChildScrollView(
                                child: Column(
                                  children: [widget.surahDetails.id!= 9
                                        ? Column(
                                      children: [
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 80,
                                              width: double.infinity,
                                              child: SizedBox.fromSize(
                                                size: Size.fromRadius(0),
                                                // Image radius
                                                child: Image.asset(
                                                  'assets/images/surah_bar.png',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),

                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  20, 05, 10, 10),
                                              child: Text(
                                                _parseHtmlString(widget.surahDetails.nameAr.toString().trim()),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    fontSize: 22.0),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  220, 12, 10, 10),
                                              child: Text(widget.surahDetails.nameEn.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 55, 10, 10),
                                              child: Text(
                                                "Ayat : " +widget.surahDetails.totalAyatEn.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  110, 55, 10, 10),
                                              child: Text(widget.surahDetails.suraTypeEn.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  210, 55, 10, 10),
                                              child: Text(
                                                "Ruku : " +"".toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  300, 55, 10, 10),
                                              child: Text(
                                                "Para : " + "".toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .bold,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                        //Text("lnrnfrlnrlngr"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 70,
                                          width: double.infinity,
                                          child: SizedBox.fromSize(
                                            size: Size.fromRadius(0),
                                            // Image radius
                                            child: Image.asset(
                                                'assets/images/quran_bismillah_bg.png',
                                                fit: BoxFit.fill),
                                          ),
                                        ),

                                      ],
                                    )
                                        : Container(),
                                    10.height,
                                    ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: _ayat.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder:_getSingleAyat
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            width: 200,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                              },
                                              // icon: Icon(Icons.navigate_before,color: Colors.white),

                                              child: Text(
                                                "Previous",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            width: 200,
                                            child: ElevatedButton(
                                              onPressed: () {

                                              },
                                              child: Text(
                                                "Next",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              //icon: Icon(Icons.navigate_next,color: Colors.white,),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body?.text).documentElement!
        .text;

    return parsedString;
  }
 Widget _getSingleAyat(BuildContext context, int position) {

    var ayat = _ayat;
    return GestureDetector(
      onLongPress: () {
        // controller.ayatList[position].
        //toast(controller.ayatList[position].toString());
      },
      child: Column(
        children: [
          _ayat.length==10
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40.0,
                width: Get.width * 0.8,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/images/option_bookmark_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/images/option_bracket_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/images/option_flag_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/images/option_ok_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/images/option_play_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/images/option_read_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/images/option_share_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              5.width,
              InkWell(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  height: 35.0,
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
              : Container(),
          Container(
            width: Get.width,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: surahBgColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.height,
                Row(
                  children: [
                    10.width,
                    Text('${_ayat[position].nameEn}'),
                    2.width,
                    Text(":"),
                    2.width,
                    Text('${_ayat[position].nameEn}'),
                    10.width,
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: brownColor),
                        height: 35.0,
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 3.0),
                  child: Html(
                    data: ayat[position].nameAr!,
                    shrinkWrap: true,
                    style: {
                      "p": Style(
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.rem(1.6),
                          textAlign: TextAlign.right,
                          direction: TextDirection.rtl,
                          whiteSpace: WhiteSpace.NORMAL,
                          display: Display.BLOCK)
                    },
                  ),
                ),
                10.height,
                Container(
                    padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                    child: Text(
                      '${ayat[position].nameEn}',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w400),
                    )),
                5.height,
                Container(
                    padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                    child: Text(
                      '${ayat[position].nameBn}'
                    /* '${lang == 'en' ? ayat.nameEn : lang == 'bn'
                          ? ayat.nameBn
                          : ayat.nameAr}'*/,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
  getallAyat() async{

     await DBProvider.db.getAyat().then((value){
          value.forEach((element) {
            print(element);
            setState(() {
              if(modifiedAyat.fromJson(element).suraId==widget.surahDetails.id){
                _ayat.add(modifiedAyat.fromJson(element));

              }
            });
          });
      });


  }
}
