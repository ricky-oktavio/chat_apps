import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.amberAccent,
            title: Text('Pencarian'),
            centerTitle: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextField(
                  controller: controller.search,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) =>
                      controller.searchUser(value, authC.user.value.email!),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Colors.amberAccent, width: 0.5)),
                      hintText: "Cari nama teman disini ....",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: Icon(Icons.search),
                      )),
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(150),
        ),
        body: Obx(
          () => controller.temp.length == 0
              ? Center(
                  child: Container(
                    height: Get.height * 0.7,
                    width: Get.width * 0.7,
                    child: Lottie.asset('assets/lottie/empty.json'),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.temp.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.amberAccent,
                        child: Image.asset(
                          'assets/logo/noimage.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        '${controller.temp[index]["name"]}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        '${controller.temp[index]["email"]}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      trailing: GestureDetector(
                          onTap: () {
                            authC.addNewConnection(
                                controller.temp[index]["email"]);
                          },
                          child: Chip(label: Text('Pesan'))),
                    );
                  },
                ),
        ));
  }
}
