import 'dart:async';

import 'package:exam_project_app/screens/option_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2), 
      vsync: this,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    animationController.forward().whenComplete(() {
      Timer(
        const Duration(seconds: 1),
        () => Get.off(() => SecondPage()), 
      );
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}