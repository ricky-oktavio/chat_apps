import 'package:chat_app/app/controllers/auth_controller.dart';

import 'package:chat_app/app/utils/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 5)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(() => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Apps Chatting",
                initialRoute: authC.isSkipIntro.isTrue
                    ? authC.isAuth.isTrue
                        ? Routes.HOME
                        : Routes.DAFTAR
                    : Routes.INTRO,
                getPages: AppPages.routes,
              ));
        }
        return FutureBuilder(
            future: authC.firstInitializer(),
            builder: (context, snapshot) => SplashScreen());
      },
    );
  }
}
