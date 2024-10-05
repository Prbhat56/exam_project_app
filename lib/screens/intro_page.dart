

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/splash_screen_controller.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    final SplashScreenController splashController = Get.put(SplashScreenController());

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: splashController.animation,
          builder: (context, child) => Opacity(
            opacity: splashController.animation.value,
            child: Image.network("https://media.istockphoto.com/id/1168414677/photo/red-speech-bubble-with-white-question-mark-symbol-on-white-background.webp?b=1&s=170667a&w=0&k=20&c=-xvBzgUGW970K5daik5JpVXuQacis0gFticRTHXhb10="), // Replace with your logo widget
          ),
        ),
      ),
    );
  }
}