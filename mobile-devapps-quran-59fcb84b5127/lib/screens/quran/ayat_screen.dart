import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qrf/controllers/ayat_controller.dart';
import 'package:qrf/model/quran/surah_list.dart';
import 'package:qrf/routes/app_pages.dart';
import 'package:qrf/screens/dialogs/details_dialog.dart';
import 'package:qrf/screens/dialogs/tafsir_dialog.dart';
import 'package:qrf/screens/quran/ayat_search_screen.dart';
import 'package:qrf/utils/color.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qrf/utils/widgets.dart';
import 'package:html/parser.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qrf/controllers/surah_controller.dart';
import 'package:qrf/screens/quran/test_screen.dart';
import 'package:qrf/screens/quran/surah_screen.dart';
import '../../model/quran/ayat_list.dart';
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

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrf/controllers/home_controller.dart';
import 'package:qrf/model/quran/ayat_list.dart';
import 'package:qrf/model/user/user..dart';
import 'package:qrf/providers/bookmark_note/bookmark_note_provider.dart';
import 'package:qrf/providers/quran/ayat_provider.dart';
import 'package:qrf/utils/session.dart';
import 'package:qrf/screens/quran/ayat_screen.dart';
import 'package:http/http.dart' as http;
import 'package:qrf/controllers/test_controller.dart';

import '../../controllers/test_controller.dart';
import '../../controllers/test_controller.dart';
import '../../controllers/test_controller.dart';
import '../../controllers/test_controller.dart';
List<String> list=[];
var endpointUrl = 'http://139.180.156.187:92/api/quran/sura/ayat';



class AyatScreen extends GetView<AyatController> {




  const AyatScreen({Key? key}) : super(key: key);

  notesDialog(var context, String surahId, String ayatId, String type) {

    String country_id;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0.0,
              backgroundColor: Colors.white,
              clipBehavior: Clip.antiAlias,
              child: Container(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  10.height,
                  Text('Save with a note', style: TextStyle(
                      fontSize: 17.0, fontWeight: FontWeight.bold)),
                  10.height,
                  Container(
                    margin: EdgeInsets.all(5.0),
                    height: 40.0,
                    child: TextFormField(
                        controller: controller.noteController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(fontSize: 12.0, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Write a note..",
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                          labelStyle: TextStyle(color: black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal),
                          hintStyle: TextStyle(color: black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal),
                          filled: true,
                          fillColor: Colors.grey[400],
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: surahBgColor, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: surahBgColor, width: 0.0),
                          ),
                        )),
                  ),
                  20.height,
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              color: Colors.red,
                              height: 40.0,
                              child: Center(
                                child: Text('Cancel', style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              var notes = controller.noteController.text;
                              if (notes.isEmptyOrNull) {
                                toast('Please enter a note');
                                return;
                              }

                              controller.noteController.clear();
                              if (controller.isLogin == true) {
                                var userId = controller.userData.id;
                                controller.addNote(
                                    userId.toString(), surahId, ayatId, type,
                                    notes);
                                Get.back();
                              } else {
                                toast('Please login to save note');
                                Get.back();
                                Get.toNamed(AppPages.getLoginRoute());
                              }
                            },
                            child: Container(
                              color: Colors.green,
                              height: 40.0,
                              child: Center(
                                child: Text('Save', style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              )),
    );
  }

  void playNextPrevAudio(var url, var type) async {
    controller.isPlayerReadyToPlay = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a network.

      if (controller.isPlayerReadyToPlay) {
        controller.isPlayingAudio ? controller.pauseAudio() : controller
            .playAudio();
      } else {
        var audioUrl = url;
        controller.setDownloadLoading();
        if (audioUrl == null) {
          toast('Audio not found');
        } else {
          controller.loadAudio("http://139.180.156.187:92${audioUrl}",
              "${controller.getRandomString(10)}-$type");
        }
      }
    } else {
      // I am not connected to a network.
      toast('Please check your internet connection');
    }
  }

  void playAudio(var url, var type) async {
    controller.isPlayerReadyToPlay = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a network.

      if (controller.isPlayerReadyToPlay) {
        controller.isPlayingAudio ? controller.pauseAudio() : controller
            .playAudio();
      } else {
        var audioUrl = url;
        if (audioUrl == null) {
          toast('Audio not found');
        } else {
          controller.setDownloadLoading();
          controller.loadAudio("http://139.180.156.187:92${audioUrl}",
              "${controller.ayatList[controller.ayatPos.value].id}$type");
        }
      }
    } else {
      // I am not connected to a network.
      toast('Please check your internet connection');
    }
  }

  /// api call with parameters
  Future<List<Surah>?> getallAyat() async {
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

   /* list.add(JsonData['name_bn']);
    list.add(JsonData['name_ar']);
    list.add(JsonData['name_en']);*/
    //toast(list.toString());

  }

  @override
  Widget build(BuildContext context) {

    String dropDownValue = "unique";
    final ScrollController _scroll = ScrollController();
    String dropdownValue = 'One';
    int? _selectedsurah=0;
    int? _selectedayat=0;



    return GetBuilder<AyatController>(builder: (controller) {
      getallAyat();
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 200.0),
                child: IconButton(
                            onPressed: () {
                              //toast("IconButton is pressed");
                              //controller.isVisible=true.obs;
                             // toast(controller.isVisible.toString());
                           showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                            return SizedBox(
                            height: 160,
                            child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children:   <Widget>
                            [

                              Padding(
                                padding: const EdgeInsets.only(right: 25.0),
                                child: Container(
                                  height: 70,
                                  width: 300,
                                  child: DropdownSearch<Surah>(
                                    items: controller.surahList.toList(),
                                    itemAsString: (Surah surah) => surah.nameEn.toString(),
                                    dropdownDecoratorProps: DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        labelText: "Search surah here",
                                        // hintText: "country in menu mode",
                                      ),

                                    ),
                                    onChanged: (surah) {
                                      _selectedsurah =surah?.id;
                                      controller.getAyatNumbers(surah!.totalAyatEn);
                                    },
                                    //selectedItem: "Brazil",
                                  ),
                                ),
                              ),
                             SizedBox(height: 10,),
                             Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 15.0),
                                   child: Container(

                                     height: 60,
                                     width: 170,


                                     child: DropdownSearch<int>(

                                         items: controller.ayatNumbers,
                                         dropdownDecoratorProps: DropDownDecoratorProps(

                                           dropdownSearchDecoration: InputDecoration(

                                             labelText: "Search ayat here",

                                             // hintText: "country in menu mode",
                                           ),
                                         ),
                                         onChanged: (_ayat)
                                         {
                                           _selectedayat=_ayat;
                                         }
                                       //selectedItem: "Brazil",
                                     ),
                                   ),
                                 ),
                                 SizedBox(width: 5,),
                                 Container(

                                   height: 50,
                                   width: 130,
                                   child:   InkWell(
                                     onTap: () {
                                      // toast("Chole asachi");
                                       //Get.offAllNamed(AppPages.getTestRoute());
                                       Get.toNamed(
                                         AppPages.getTestRoute(),
                                         arguments: [
                                           {"surah_id": "${_selectedsurah}"},
                                           {"selected_ayatnumber": "${_selectedayat}"},

                                         ],
                                       );
                                     },
                                     child: Container(
                                       padding: EdgeInsets.all(10.0),
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10.0),
                                           color: primaryColor),
                                       child: Center(
                                         child: Text(
                                           'Submit'.toUpperCase(),
                                           style: TextStyle(
                                               color: Colors.white, fontSize: 15.0),
                                         ),
                                       ),
                                     ),
                                   )
                                 )


                               ],
                             ),








                            ],
                            )
                          );

                            }
                            );



                /*    if (_selectedayat != 0 && _selectedsurah != 0) {
                    toast(_selectedsurah.toString() + " " + _selectedayat.toString());
                    Get.toNamed(
                    AppPages.getTestRoute(),
                    arguments: [
                    {"surah_id": "${_selectedsurah}"},
                    {"selected_ayatnumber": "${_selectedayat}"},

                    ],
                    );
                    }*/
                    },


                     icon: Icon(Icons.search)

          ),
              ),

          ],
          /*
          title: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: 100,

                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 10,
                      width: 300,
                      child: DropdownSearch<Surah>(
                        items: controller.surahList.toList(),
                        itemAsString: (Surah surah) => surah.nameEn.toString(),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Search",
                            // hintText: "country in menu mode",
                          ),

                        ),
                        onChanged: (surah) {
                          _selectedsurah =surah?.id;
                          controller.getAyatNumbers(surah!.totalAyatEn);
                        },
                        //selectedItem: "Brazil",
                      ),

                    ),
                  ),
                ),
                Container(
                  height: 10,
                  width: 300,

                  child: Column(
                    children: [
                      DropdownSearch<int>(


                          items: controller.ayatNumbers,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(

                              labelText: "Search",
                              // hintText: "country in menu mode",
                            ),
                          ),
                          onChanged: (_ayat)
                          {
                            _selectedayat=_ayat;
                          }
                        //selectedItem: "Brazil",
                      ),


                    ],

                  ),
                ),
               *//* IconButton(
                  onPressed: () {
                    if (_selectedayat != 0 && _selectedsurah != 0) {
                      toast(_selectedsurah.toString()+" "+_selectedayat.toString());
                      Get.toNamed(
                          AppPages.getTestRoute(),
                          arguments: [
                          {"surah_id": "${_selectedsurah}"},
                          {"selected_ayatnumber": "${_selectedayat}"},

                          ],
                      );

                      *//**//*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TestScreen()),

                      );

                       *//**//*
                    }

                    else
                      {
                        toast("Invalid Search");
                      }
                  },
                  icon: Icon(Icons.search),

                )*//*
              ],
            ),
          ),

        ),*/
        /* title: Text('Al QURAN'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              )),


         // centerTitle: true,
         // shape: AppbarShapeBorderSurahPage(),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back),
          ),
          actions: [
            Container(
              height: 50,
              width: 50,
              color: Colors.red,
              child: DropdownSearch<Surah>(

                items: controller.surahList.toList(),
                itemAsString: (Surah surah)=>surah.nameEn.toString(),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Search",
                    // hintText: "country in menu mode",
                  ),
                ),
                onChanged: print,
                //selectedItem: "Brazil",
              ),
            )

          ],

          title: Row(
            mainAxisAlignment:  MainAxisAlignment.start,
            children: [
              DropdownSearch<Surah>(

                items: controller.surahList.toList(),
                itemAsString: (Surah surah)=>surah.nameEn.toString(),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Search",
                   // hintText: "country in menu mode",
                  ),
                ),
                onChanged: print,
                //selectedItem: "Brazil",
              )

            ],
          ),

          ),
          /*actions: [
            Container(
              child: DropdownSearch<String>.multiSelection(
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                popupProps: PopupPropsMultiSelection.menu(
                  showSelectedItems: true,
                  disabledItemFn: (String s) => s.startsWith('I'),
                ),
                onChanged: print,
                selectedItems: ["Brazil"],
              ),
            )


          // Text("Ruabela")


           /* IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    backgroundColor: Colors.amber[100],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    content: Builder(
                      builder: (context) {
                        // Get available height and width of the build area of this widget. Make a choice depending on the size.
                        var height = MediaQuery.of(context).size.height;
                        var width = MediaQuery.of(context).size.width;

                        return Container(
                          height: height,
                          width: width,
                          child: Column(
                            children: [
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.red, fontSize: 18),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (value){

                                },
                                items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                width: 10,
                                height: 10,
                              ),

                              SizedBox(
                                width: 10,
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  var keyword = controller.suraNameController.text;
                                  if (keyword.isEmptyOrNull) {
                                    toast('Please enter a keyword');
                                    return;
                                  }

                                  controller.suraNameController.clear();
                                  controller.ayatNumberController.clear();
                                  Get.toNamed(AppPages.getAyatSearchRoute(), arguments: [
                                    {"keyword": keyword}
                                  ]);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  alignment: Alignment.center,
                                  color: Colors.red,
                                  child: Text("Search"),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  /*actions: [
                      Column(
                        children: [
                          Container(
                            height: 40.0,
                            width: double.infinity,
                            child: TextFormField(
                                controller: controller.suraNameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                autofocus: false,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                style: TextStyle(fontSize: 12.0, color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: "Surah Number",
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
                          SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          Container(
                            height: 40.0,
                            width: double.infinity,
                            child: TextFormField(
                              controller: controller.ayatNumberController,
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
                              ),),
                          ),
                          SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          InkWell(

                            onTap: () {
                              var keyword = controller.suraNameController.text;
                              if (keyword.isEmptyOrNull) {
                                toast('Please enter a keyword');
                                return;
                              }

                              controller.suraNameController.clear();
                              controller.ayatNumberController.clear();
                              Get.toNamed(AppPages.getAyatSearchRoute(), arguments: [
                                {"keyword": keyword}
                              ]);
                            },
                            child: Image.asset('assets/images/search_icon.png'),
                          ),
                        ],
                      ),
                    ],*/
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),

               */





          ],
        ),


           */
        //appBar: CustomAppBarSurahPage(title: 'Al Quran'.toUpperCase(), height: 80.0),
        /* appBar:  AppBar(
            title: Text('My App'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
          ),*/


          */
      ),
        ),


        body: Stack(
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
                /* Container(
                    height: 60.0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Stack(
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
              /*  Obx( ()=>
                    Visibility(
                    visible:controller.isVisible.value,
                    child: Container(
                      height: 130.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                                        Container(
                                          child: DropdownSearch<Surah>(
                                          items: controller.surahList.toList(),
                                          itemAsString: (Surah surah) => surah.nameEn.toString(),
                                          dropdownDecoratorProps: DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                          labelText: "Search",
                                          // hintText: "country in menu mode",
                                          ),

                                          ),
                                          onChanged: (surah) {
                                          _selectedsurah =surah?.id;
                                          controller.getAyatNumbers(surah!.totalAyatEn);
                                          },
                                          //selectedItem: "Brazil",
                                          ),
                                        ),



                                   Container(
                                     child: DropdownSearch<int>(

                                items: controller.ayatNumbers,
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(

                                      labelText: "Search",
                                      // hintText: "country in menu mode",
                                  ),
                                ),
                                onChanged: (_ayat)
                                {
                                  _selectedayat=_ayat;
                                }
                              //selectedItem: "Brazil",
                            ),
                                   ),





                            *//*InkWell(
                                onTap: () {
                                  controller.showPopupMenu();
                                },
                                child: Image.asset('assets/images/quran_share_icon.png'),
                              ),
                              Container(
                                height: 40.0,
                                width: 160.0,
                                child: TextFormField(
                                    controller: controller.suraNameController,
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
                                width: 120.0,
                                child: TextFormField(
                                    controller: controller.ayatNumberController,
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
                                onTap: () {
                                  var keyword = controller.suraNameController.text;
                                  if (keyword.isEmptyOrNull) {
                                    toast('Please enter a keyword');
                                    return;
                                  }
                                  controller.suraNameController.clear();
                                  controller.ayatNumberController.clear();
                                  Get.toNamed(AppPages.getAyatSearchRoute(), arguments: [
                                    {"keyword": keyword}
                                  ]);
                                },
                                child: Image.asset('assets/images/search_icon.png'),
                              ),*//*
                          ],
                        ),
                      ),
                      width: double.infinity,
                    ),
                  ),
                ),*/
                10.height,
                Expanded(
                  child: Stack(
                    children: [
                      controller.isVisiblePlayBg
                          ? Container(
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
                                /* InkWell(
                                          onTap: () {
                                            controller.loopAudio();
                                          },
                                          child: Image.asset(
                                              'assets/images/player_suffle_icon.png'),
                                        ), */
                                InkWell(
                                  onTap: () {
                                    /* var time =
                                                controller.position.inSeconds -
                                                    1;
                                            Duration decrease =
                                                Duration(seconds: time);

                                            controller.seekAudio(decrease); */

                                    controller.audioCache.clearAll();
                                    switch (controller.selectedSurahType
                                        .value) {
                                      case "bn":
                                        var position = controller.audioPos
                                            .value;

                                        var newPos = position - 1;
                                        if (newPos >= 0) {
                                          controller.setAudioPosition(newPos);
                                          var audioUrl = controller
                                              .ayatList[newPos].audioBn;
                                          playNextPrevAudio(audioUrl, 'bn');
                                        } else {
                                          toast(
                                              'No more ayat to play in this surah');
                                        }
                                        break;
                                      case "en":
                                        var position = controller.audioPos
                                            .value;

                                        var newPos = position - 1;
                                        if (newPos >= 0) {
                                          controller.setAudioPosition(newPos);
                                          var audioUrl = controller
                                              .ayatList[newPos].audioEn;
                                          playNextPrevAudio(audioUrl, 'en');
                                        } else {
                                          toast(
                                              'No more ayat to play in this surah');
                                        }
                                        break;
                                      case "ar":
                                        var position = controller.audioPos
                                            .value;
                                        var newPos = position - 1;
                                        if (newPos >= 0) {
                                          controller.setAudioPosition(newPos);
                                          var audioUrl = controller
                                              .ayatList[newPos].audioAr;
                                          playNextPrevAudio(audioUrl, 'ar');
                                        } else {
                                          toast(
                                              'No more ayat to play in this surah');
                                        }
                                        break;
                                    }
                                  },
                                  child: Image.asset(
                                      'assets/images/player_back_forward_icon.png'),
                                ),
                                Stack(
                                  children: [
                                    Visibility(
                                      visible: controller.isDownloadingstart
                                          ? false
                                          : true,
                                      child: InkWell(
                                        onTap: () async {
                                          if (controller.isPlayerReadyToPlay) {
                                            controller.isPlayingAudio
                                                ? controller.pauseAudio()
                                                : controller.playAudio();
                                          } else {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (context) =>
                                                  Dialog(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(16),
                                                      ),
                                                      elevation: 0.0,
                                                      backgroundColor: Colors
                                                          .white,
                                                      clipBehavior: Clip
                                                          .antiAlias,
                                                      child: Container(
                                                        child: Column(
                                                            mainAxisSize: MainAxisSize
                                                                .min,
                                                            crossAxisAlignment: CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                height: 60.0,
                                                                child: Stack(
                                                                  children: [
                                                                    Center(
                                                                      child: Text(
                                                                          'Choose audio type',
                                                                          style: TextStyle(
                                                                              fontSize: 19.0,
                                                                              fontWeight: FontWeight
                                                                                  .bold)),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right: 5.0),
                                                                      child: Align(
                                                                          alignment: Alignment
                                                                              .centerRight,
                                                                          child: InkWell(
                                                                            onTap: () {
                                                                              Get
                                                                                  .back();
                                                                            },
                                                                            child: Container(
                                                                              height: 40.0,
                                                                              width: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                  shape: BoxShape
                                                                                      .circle,
                                                                                  color: Colors
                                                                                      .red),
                                                                              child: Center(
                                                                                child: Icon(
                                                                                    Icons
                                                                                        .close,
                                                                                    color: Colors
                                                                                        .white),
                                                                              ),
                                                                            ),
                                                                          )),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              10.height,
                                                              InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .audioCache
                                                                      .clearAll();
                                                                  var audioUrl = controller
                                                                      .ayatList[controller
                                                                      .ayatPos
                                                                      .value]
                                                                      .audioBn;
                                                                  playAudio(
                                                                      audioUrl,
                                                                      'bn');
                                                                  controller
                                                                      .setSelectedSurahType(
                                                                      "bn");
                                                                  Get.back();
                                                                },
                                                                child: Container(
                                                                  alignment: Alignment
                                                                      .center,
                                                                  height: 40.0,
                                                                  width: 150.0,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius
                                                                          .circular(
                                                                          5.0),
                                                                      color: Colors
                                                                          .grey[300]),
                                                                  child: Text(
                                                                      'Bangla',
                                                                      style: TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight: FontWeight
                                                                              .bold)),
                                                                ),
                                                              ),
                                                              10.height,
                                                              InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .audioCache
                                                                      .clearAll();
                                                                  var audioUrl = controller
                                                                      .ayatList[controller
                                                                      .ayatPos
                                                                      .value]
                                                                      .audioEn;
                                                                  playAudio(
                                                                      audioUrl,
                                                                      'en');

                                                                  controller
                                                                      .setSelectedSurahType(
                                                                      "en");
                                                                  Get.back();
                                                                },
                                                                child: Container(
                                                                  alignment: Alignment
                                                                      .center,
                                                                  height: 40.0,
                                                                  width: 150.0,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius
                                                                          .circular(
                                                                          5.0),
                                                                      color: Colors
                                                                          .grey[300]),
                                                                  child: Text(
                                                                      'English',
                                                                      style: TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight: FontWeight
                                                                              .bold)),
                                                                ),
                                                              ),
                                                              10.height,
                                                              InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .audioCache
                                                                      .clearAll();
                                                                  var audioUrl = controller
                                                                      .ayatList[controller
                                                                      .ayatPos
                                                                      .value]
                                                                      .audioAr;
                                                                  playAudio(
                                                                      audioUrl,
                                                                      'ar');
                                                                  controller
                                                                      .setSelectedSurahType(
                                                                      "ar");
                                                                  Get.back();
                                                                },
                                                                child: Container(
                                                                  alignment: Alignment
                                                                      .center,
                                                                  height: 40.0,
                                                                  width: 150.0,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius
                                                                          .circular(
                                                                          5.0),
                                                                      color: Colors
                                                                          .grey[300]),
                                                                  child: Text(
                                                                      'Arabic',
                                                                      style: TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight: FontWeight
                                                                              .bold)),
                                                                ),
                                                              ),
                                                              10.height,
                                                            ]),
                                                      )),
                                            );
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 8.0,
                                              right: 8.0,
                                              top: 8.0,
                                              bottom: 8.0),
                                          child: Image.asset(
                                              controller.playPauseIcon),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller.isDownloadingstart
                                          ? true
                                          : false,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 8.0,
                                            right: 8.0,
                                            top: 8.0,
                                            bottom: 8.0),
                                        child: SpinKitFadingCircle(
                                          color: Colors.white,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    /* var time =
                                                controller.position.inSeconds +
                                                    1;

                                            Duration increase =
                                                Duration(seconds: time);
                                            controller.seekAudio(increase); */

                                    controller.audioCache.clearAll();
                                    switch (controller.selectedSurahType
                                        .value) {
                                      case "bn":
                                        var position = controller.audioPos
                                            .value;

                                        var newPos = position + 1;
                                        if (controller.ayatList.length - 1 >=
                                            newPos) {
                                          controller.setAudioPosition(newPos);
                                          var audioUrl = controller
                                              .ayatList[newPos].audioBn;
                                          playNextPrevAudio(audioUrl, 'bn');
                                        } else {
                                          toast(
                                              'No more ayat to play in this surah');
                                        }
                                        break;
                                      case "en":
                                        var position = controller.audioPos
                                            .value;

                                        var newPos = position + 1;
                                        if (controller.ayatList.length - 1 >=
                                            newPos) {
                                          controller.setAudioPosition(newPos);
                                          var audioUrl = controller
                                              .ayatList[newPos].audioEn;
                                          playNextPrevAudio(audioUrl, 'en');
                                        } else {
                                          toast(
                                              'No more ayat to play in this surah');
                                        }
                                        break;
                                      case "ar":
                                        var position = controller.audioPos
                                            .value;
                                        var newPos = position + 1;
                                        if (controller.ayatList.length - 1 >=
                                            newPos) {
                                          controller.setAudioPosition(newPos);
                                          var audioUrl = controller
                                              .ayatList[newPos].audioAr;
                                          playNextPrevAudio(audioUrl, 'ar');
                                        } else {
                                          toast(
                                              'No more ayat to play in this surah');
                                        }
                                        break;
                                    }
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
                                  controller.setPlayBgshowHide(false);
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
                      )
                          : Container(),
                      Container(
                        margin: EdgeInsets.only(top: controller.isVisiblePlayBg
                            ? 100.0
                            : 0.0),
                        child: Column(
                          children: [
                            /*Obx(
                                () => controller.isLoading.value
                                    ? Container()
                                    : Visibility(
                                        visible: controller.iconContainerHeight.value > 0,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/surah_frame.png'), fit: BoxFit.cover)),
                                            height: 80.0,
                                            child: Center(
                                              child: Stack(
                                                children: <Widget>[
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Image.asset('assets/images/surah_frame_center.png'),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(bottom: 15.0),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 40.0,
                                                            child: Html(
                                                              data: '${controller.ayatList[0].suraNameAr}',
                                                              shrinkWrap: true,
                                                              style: {
                                                                "p": Style(
                                                                    padding: EdgeInsets.only(right: 10.0),
                                                                    fontFamily: 'Quran Font',
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: FontSize.rem(1.5),
                                                                    textAlign: TextAlign.right,
                                                                    whiteSpace: WhiteSpace.NORMAL,
                                                                    display: Display.BLOCK)
                                                              },
                                                            ),
                                                          ),
                                                          Text('${controller.ayatList[0].suraNameBn}',
                                                              style: TextStyle(fontSize: 12.0, fontFamily: 'Bangla Font', fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 17,
                                                      left: 25,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Row(
                                                            children: [
                                                              Text('সুরাঃ',
                                                                  style: TextStyle(
                                                                      color: Colors.grey.shade200, fontFamily: 'Bangla Font', fontSize: 15.0, fontWeight: FontWeight.bold)),
                                                              5.width,
                                                              Text('${controller.surahNumber}',
                                                                  style: TextStyle(color: Colors.grey.shade200, fontSize: 15.0, fontWeight: FontWeight.bold)),
                                                            ],
                                                          ),
                                                          5.height,
                                                          Row(
                                                            children: [
                                                              Text('আয়াতঃ',
                                                                  style: TextStyle(
                                                                      color: Colors.grey.shade200, fontFamily: 'Bangla Font', fontSize: 15.0, fontWeight: FontWeight.bold)),
                                                              5.width,
                                                              Text('${controller.totalAyatBn}',
                                                                  style: TextStyle(
                                                                      color: Colors.grey.shade200, fontFamily: 'Bangla Font', fontSize: 15.0, fontWeight: FontWeight.bold)),
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                  Positioned(
                                                      top: 17,
                                                      right: 25,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Row(
                                                            children: [
                                                              Text('${controller.surahTypeBn}',
                                                                  style: TextStyle(
                                                                      color: Colors.grey.shade200, fontFamily: 'Bangla Font', fontSize: 15.0, fontWeight: FontWeight.bold)),
                                                            ],
                                                          ),
                                                          5.height,
                                                          Row(
                                                            children: [
                                                              Text('রুকুঃ',
                                                                  style: TextStyle(
                                                                      color: Colors.grey.shade200, fontFamily: 'Bangla Font', fontSize: 15.0, fontWeight: FontWeight.bold)),
                                                              5.width,
                                                              Text('${controller.ayatList[0].rukuNumber}',
                                                                  style: TextStyle(color: Colors.grey.shade200, fontSize: 15.0, fontWeight: FontWeight.bold)),
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),*/
                            Expanded(
                              child: Obx(
                                    () =>
                                controller.isLoading.value
                                    ? Center(child: CircularProgressIndicator())
                                    : SingleChildScrollView(
                                  controller: controller.scrollController,
                                  child: Column(
                                    children: [
                                      controller.ayatList[0].suraId != 9
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
                                                  _parseHtmlString(controller
                                                      .ayatList[0].suraNameAr
                                                      .toString().trim()),
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
                                                child: Text(
                                                  controller.ayatList[0]
                                                      .suraNameEn.toString(),
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
                                                  "Ayat : " +
                                                      controller.totalAyatEn
                                                          .toString(),
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
                                                child: Text(
                                                  controller.surahTypeEn,
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
                                                  "Ruku : " +
                                                      controller.ayatList[0]
                                                          .ruku.toString(),
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
                                                  "Para : " +
                                                      controller.ayatList[0]
                                                          .paraId.toString(),
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
                                          /* Container(
                                                          padding: EdgeInsets.only(left: 10.0, right: 10.0,top: 5),
                                                          child: Image.asset('assets/images/quran_bismillah_bg.png', fit: BoxFit.fill),
                                                        ),*/
                                        ],
                                      )
                                          : Container(),
                                      10.height,
                                      ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: controller.ayatList.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: _getSingleAyat,
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
                                                  if (controller.surahNumber ==
                                                      "1") {
                                                    toast("No Previous Surah");
                                                    return;
                                                  }
                                                  int index = int.parse(
                                                      controller.surahNumber) -
                                                      1;
                                                  //toast(index.toString());
                                                  var surah = controller
                                                      .surahList[index - 1];
                                                  var argData = [
                                                    {"surah_id": "${surah.id}"},
                                                    {"total_ayat_en": surah
                                                        .totalAyatEn},
                                                    {"total_ayat_bn": surah
                                                        .totalAyatBn},
                                                    {"total_ayat_ar": surah
                                                        .totalAyatAr},
                                                    {"surah_type_en": surah
                                                        .suraTypeEn},
                                                    {"surah_type_bn": surah
                                                        .suraTypeBn},
                                                    {"surah_type_ar": surah
                                                        .suraTypeAr},
                                                    {"surah_list": controller
                                                        .surahList},
                                                  ];

                                                  controller.isLoading =
                                                      true.obs;
                                                  controller.argData = argData;
                                                  controller.getAyatList(index);
                                                  controller.onInit();
                                                  controller.update();
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
                                                  if (controller.surahNumber ==
                                                      "114") {
                                                    toast("No More Surah");
                                                    return;
                                                  }
                                                  int index = int.parse(
                                                      controller.surahNumber) +
                                                      1;
                                                  //toast(index.toString());
                                                  var surah = controller
                                                      .surahList[index - 1];
                                                  var argData = [
                                                    {"surah_id": "${surah.id}"},
                                                    {"total_ayat_en": surah
                                                        .totalAyatEn},
                                                    {"total_ayat_bn": surah
                                                        .totalAyatBn},
                                                    {"total_ayat_ar": surah
                                                        .totalAyatAr},
                                                    {"surah_type_en": surah
                                                        .suraTypeEn},
                                                    {"surah_type_bn": surah
                                                        .suraTypeBn},
                                                    {"surah_type_ar": surah
                                                        .suraTypeAr},
                                                    {"surah_list": controller
                                                        .surahList},
                                                  ];
                                                  controller.isLoading =
                                                      true.obs;
                                                  controller.argData = argData;
                                                  controller.getAyatList(index);
                                                  controller.onInit();
                                                  controller.update();
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
    });
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body?.text).documentElement!
        .text;

    return parsedString;
  }

  Widget _getSingleAyat(BuildContext context, int position) {
    String lang = Get.locale.toString();
    var ayat = controller.ayatList[position];
    return GestureDetector(
      onLongPress: () {
        // controller.ayatList[position].
        //toast(controller.ayatList[position].toString());
      },
      child: Column(
        children: [
          ayat.moreButton
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
                        int selectAyatPos = controller.ayatList.indexWhere((
                            element) => element.id == ayat.id);
                        controller.setSelectedTafsirIndex(selectAyatPos);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AyatTafsirDialog(),
                              );
                            });
                      },
                      child: Image.asset(
                        'assets/images/option_bookmark_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        int selectAyatPos = controller.ayatList.indexWhere((
                            element) => element.id == ayat.id);
                        controller.setSelectedTafsirIndex(selectAyatPos);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AyatDetailsDialog(),
                              );
                            });
                      },
                      child: Image.asset(
                        'assets/images/option_bracket_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showConfirmDialogCustom(
                          context,
                          title: "Do you want to bookmark this ayat?",
                          dialogType: DialogType.CONFIRMATION,
                          onAccept: (context) {
                            if (controller.isLogin == true) {
                              var userId = controller.userData.id;
                              controller.addBookmarkNote(userId.toString(),
                                  controller.argData[0]['surah_id'],
                                  ayat.id.toString(), "Bookmark");
                            } else {
                              toast('Please login to add bookmark');
                              Get.back();
                              Get.toNamed(AppPages.getLoginRoute());
                            }
                          },
                        );
                      },
                      child: Image.asset(
                        'assets/images/option_flag_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        notesDialog(context, controller.argData[0]['surah_id'],
                            ayat.id.toString(), "Note");
                      },
                      child: Image.asset(
                        'assets/images/option_ok_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.isVisiblePlayBg ? controller
                            .setPlayBgshowHide(false) : controller
                            .setPlayBgshowHide(true);
                      },
                      child: Image.asset(
                        'assets/images/option_play_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        toast("Don't understand what to do");
                      },
                      child: Image.asset(
                        'assets/images/option_read_icon.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        toast("Coming soon");
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
                  controller.hideMoreButton(ayat.id);
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
                    Text('${ayat.suraId}'+"TestsuraId"),
                    2.width,
                    Text(":"),
                    2.width,
                    Text('${ayat.ayaNumber}+"TestAyatNumber'),
                    10.width,
                    InkWell(
                      onTap: () {
                        controller.ayatPos.value = position;
                        controller.setAudioPosition(position);
                        controller.isPlayerReadyToPlay = false;
                        controller.audioCache.clearAll();
                        controller.setPlayBgshowHide(false);
                        controller.showMoreButton(ayat.id);
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

                /* Flexible(
                                                              child: Container(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: Wrap(
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .end,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .end,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .end,
                                                                  children: List.generate(
                                                                      ayat.ayatWordBank
                                                                              ?.length ??
                                                                          0,
                                                                      (index) {
                                                                    var wordList = controller
                                                                        .ayatList[
                                                                            position]
                                                                        .ayatWordBank;
                                                                    List<AyatWordBank>
                                                                        reversedWordList =
                                                                        wordList!
                                                                            .reversed
                                                                            .toList();
                                                                    AyatWordBank
                                                                        word =
                                                                        reversedWordList[
                                                                            index];
                                                                    return InkWell(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                                3.0),
                                                                        child:
                                                                            Html(
                                                                          data: word
                                                                              .nameAr,
                                                                          shrinkWrap:
                                                                              true,
                                                                          style: {
                                                                            "p": Style(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: FontSize.rem(1.6),
                                                                                textAlign: TextAlign.center,
                                                                                whiteSpace: WhiteSpace.NORMAL,
                                                                                display: Display.BLOCK)
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                ),
                                                              ),
                                                            ), */
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 3.0),
                  child: Html(
                    data: ayat.nameAr!+"TestAr",
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
                      '${ayat.nameEn}'+"TestEn",
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w400),
                    )),
                5.height,
                Container(
                    padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                    child: Text(
                      '${lang == 'en' ? ayat.nameEn : lang == 'bn'
                          ? ayat.nameBn
                          : ayat.nameAr}',
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

}