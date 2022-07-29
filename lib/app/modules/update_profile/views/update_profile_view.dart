import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    controller.email.text = authC.user.value.email!;
    controller.nama.text = authC.user.value.name!;
    controller.status.text = authC.user.value.status!;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text('Update Profil'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  authC.changeProfile(
                      controller.nama.text, controller.status.text);
                  Get.back();
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AvatarGlow(
                endRadius: 110,
                glowColor: Colors.black,
                duration: Duration(seconds: 2),
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  child: Obx(() => ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: authC.user.value.photoUrl == "noimage"
                            ? Image.asset("assets/logo/noimage.png",
                                fit: BoxFit.cover)
                            : Image.network(
                                authC.user.value.photoUrl!,
                                fit: BoxFit.cover,
                              ),
                      )),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                cursorColor: Colors.black,
                controller: controller.email,
                readOnly: true,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: "e - Mail",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Colors.amberAccent))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                cursorColor: Colors.black,
                controller: controller.nama,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: "Nama",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Colors.amberAccent))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                cursorColor: Colors.black,
                controller: controller.status,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  authC.changeProfile(
                      controller.nama.text, controller.status.text);
                },
                decoration: InputDecoration(
                    labelText: "Status",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(color: Colors.amberAccent))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('tidak ada gambar'),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'pilih file',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  width: Get.width,
                  child: ElevatedButton(
                      onPressed: () {
                        authC.changeProfile(
                            controller.nama.text, controller.status.text);
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
