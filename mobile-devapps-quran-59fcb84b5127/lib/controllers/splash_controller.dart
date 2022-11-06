import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrf/routes/app_pages.dart';

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
}
