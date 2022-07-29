import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStatusController extends GetxController {
  late TextEditingController updateStatus;

  @override
  void onInit() {
    updateStatus = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    updateStatus.dispose();
    super.onClose();
  }
}
