import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/daftar_controller.dart';

class DaftarView extends GetView<DaftarController> {
  final AuthC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(35),
      child: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.7,
              child: Lottie.asset('assets/lottie/logins.json'),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                AuthC.login();
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 25,
                      height: 25,
                      child: Image.asset('assets/logo/googlelogo.png')),
                  SizedBox(width: 15),
                  Text(
                    'Daftar dengan Google',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'App Chat by RickDevs',
            ),
            Text('version 1.0.0', style: TextStyle(fontSize: 15))
          ],
        ),
      )),
    ));
  }
}
