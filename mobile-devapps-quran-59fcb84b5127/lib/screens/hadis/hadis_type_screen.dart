import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qrf/controllers/hadis_type_controller.dart';
import 'package:qrf/routes/app_pages.dart';
import 'package:qrf/utils/color.dart';
import 'package:qrf/utils/widgets.dart';

class HadisTypeScreen extends GetView<HadisTypeController> {
  HadisTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appBgColor,
      appBar: CustomAppBar(title: 'AL HADITH'.toUpperCase(), height: 80.0),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/app_bg.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /* Container(
                    height: 60.0,
                    margin: EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 140.0,
                          child: TextFormField(
                              controller:
                                  controller.hadisNameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Hadith Name",
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 5, 0),
                                labelStyle: TextStyle(
                                    color: black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal),
                                hintStyle: TextStyle(
                                    color: black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal),
                                filled: true,
                                fillColor: Colors.grey[400],
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: surahBgColor, width: 0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: surahBgColor, width: 0.0),
                                ),
                              )),
                        ),
                        Container(
                          height: 40.0,
                          width: 140.0,
                          child: TextFormField(
                              controller:
                                  controller.hadisNumberController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Hadith Number",
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 5, 0),
                                labelStyle: TextStyle(
                                    color: black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal),
                                hintStyle: TextStyle(
                                    color: black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal),
                                filled: true,
                                fillColor: Colors.grey[400],
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: surahBgColor, width: 0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: surahBgColor, width: 0.0),
                                ),
                              )),
                        ),
                        InkWell(
                            onTap: () {
                              var keyword =
                                  controller.hadisNameController.text;
                              if (keyword.isEmptyOrNull) {
                                toast('Please enter a keyword');
                                return;
                              }
                              Get.toNamed(
                                  AppPages.getHadisSearchRoute(),
                                  arguments: [
                                    {"keyword": keyword}
                                  ]);
                            },
                            child: Image.asset(
                                'assets/images/search_icon.png')),
                      ],
                    ),
                  ),*/
                  30.height,
                  Text(
                    'AL HADITH',
                    style: TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Text('আল হাদিস',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w500)),
                  20.height,
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppPages.getHadisRoute());
                    },
                    child: Container(
                      height: Get.width * 0.4,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/lenear_gradient_background.png'),
                            fit: BoxFit.fitWidth),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/hadith_navigation.png',
                            height: 80.0,
                            width: 80.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0),
                            child: Text('সনদ ও মতন সহী হাদিস',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.height,
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppPages.getHadisRoute());
                    },
                    child: Container(
                      height: Get.width * 0.4,
                      width: Get.width * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/lenear_gradient_background.png'),
                            fit: BoxFit.fitWidth),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/white_book_icon.png',
                            height: 80.0,
                            width: 80.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0),
                            child: Text('অন্যান্য হাদিস',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
