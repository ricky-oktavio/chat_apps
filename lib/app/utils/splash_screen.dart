import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: Get.width * 0.8,
            height: Get.height * 0.8,
            child: Lottie.asset('assets/lottie/bubble_hello.json'),
          ),
        ),
      ),
    );
  }
}
