import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_status_controller.dart';

class UpdateStatusView extends GetView<UpdateStatusController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    controller.updateStatus.text = authC.user.value.status!;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text('Update Status'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller.updateStatus,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  authC.updateStatus(controller.updateStatus.text);
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelText: "Status",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.amberAccent))),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: Get.width,
                  child: ElevatedButton(
                      onPressed: () {
                        authC.updateStatus(controller.updateStatus.text);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amberAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10)),
                      child: Text(
                        'UPDATE',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )))
            ],
          ),
        ));
  }
}
