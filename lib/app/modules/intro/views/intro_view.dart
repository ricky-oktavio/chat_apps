import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Terhubung dengan mudah",
          body: "Berinteraksi dengan genggaman dengan teman dan keluarga",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
              child: Lottie.asset('assets/lottie/chattings.json'),
            ),
          ),
        ),
        PageViewModel(
          title: "Temukanlah sahabat baru kamu",
          body: "Kalau memang jodoh dari aplikasi sini, kami bahagia",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
              child: Lottie.asset('assets/lottie/lovers.json'),
            ),
          ),
        ),
        PageViewModel(
          title: "Tanpa iklan dan biaya",
          body: "Gak perlu mikir deh kalau tentang biaya lain, dijamin gratis ",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
              child: Lottie.asset('assets/lottie/free.json'),
            ),
          ),
        ),
        PageViewModel(
          title: "Ayo gabung dengan kami sekarang juga",
          body: "Segera daftar agar dapat banyak teman ",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
              child: Lottie.asset('assets/lottie/register.json'),
            ),
          ),
        ),
      ],
      onDone: () => Get.offAllNamed(Routes.DAFTAR),
      showBackButton: false,
      showSkipButton: true,
      skip: Text('Lewati'),
      next: Text(
        'Selanjutnya',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      done: const Text("Login", style: TextStyle(fontWeight: FontWeight.w600)),
    ));
  }
}
