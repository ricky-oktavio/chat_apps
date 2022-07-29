import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  late TextEditingController email;
  late TextEditingController nama;
  late TextEditingController status;
  @override
  void onInit() {
    email = TextEditingController();
    nama = TextEditingController();
    status = TextEditingController();
  }

  @override
  void onClose() {
    email.dispose();
    nama.dispose();
    status.dispose();
    super.onClose();
  }
}
