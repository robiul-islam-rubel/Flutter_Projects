import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qrf/routes/app_pages.dart';

import '../providers/quran/ayat_provider.dart';
import '../providers/quran/test_provider.dart';
import 'database/quran_database.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  /* HomeScreen */
  double progress = 0.0;

  late AnimationController animationController;
  late Animation animation;
  late StreamController<double> streamController;
  late Stream<double> stream;
  @override
  onInit() {
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        // update like setState
        streamController.sink.add(animation.value);
      });

    animationController.forward().whenComplete(() {
      _redirectToPage();
    });

    streamController = StreamController();
    stream = streamController.stream;
    post_to_db();
   post_to_db_allayat();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  _redirectToPage() async {
    animationController.stop();
    Get.offAllNamed(AppPages.getHomeRoute());
  }
  void post_to_db() async {
    final suraList = await SurahApiProvider().getallSurah();
      await DBProvider.db.createSurah(suraList.toList());
  }
  void post_to_db_allayat() async
  {
    final _modifiedayat= await AyatProvider().getAllAyat();
    await DBProvider.db.createmodifiedayat(_modifiedayat.toList());

  }
}
