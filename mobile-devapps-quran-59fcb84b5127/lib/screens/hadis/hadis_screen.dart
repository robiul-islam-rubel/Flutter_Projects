import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qrf/controllers/hadis_controller.dart';
import 'package:qrf/routes/app_pages.dart';
import 'package:qrf/utils/color.dart';
import 'package:qrf/utils/widgets.dart';

class HadisScreen extends GetView<HadisController> {
  const HadisScreen({Key? key}) : super(key: key);

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
          Column(
            children: <Widget>[
              
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 40.0,
                                width: 140.0,
                                child: TextFormField(
                                    controller: controller.hadisNameController,
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
                                    Get.toNamed(AppPages.getHadisSearchRoute(),
                                        arguments: [
                                          {"keyword": keyword}
                                        ]);
                                  },
                                  child: Image.asset(
                                      'assets/images/search_icon.png')),
                            ],
                          ),
                        ),
                        10.height,
                        Obx(
                          () => controller.isLoading.value
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.hadisList.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            AppPages.getHadisDetailsRoute(),
                                            arguments: [
                                              {
                                                'hadis_id': controller
                                                    .hadisList[index].id
                                              }
                                            ]);
                                      },
                                      child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 2.0),
                                        ),
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5.0),
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          '${controller.hadisList[index].hadisAr}',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
