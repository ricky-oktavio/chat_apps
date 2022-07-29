import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final List<Widget> myChat = List.generate(
      20,
      (index) => ListTile(
            onTap: () {
              Get.toNamed(Routes.CHATROOM);
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.amberAccent,
              child: Image.asset(
                'assets/logo/noimage.png',
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              'User ${index + 1}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'User ${index + 1}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            trailing: Chip(label: Text('3')),
          )).reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: () {
          Get.toNamed(Routes.SEARCH);
        },
        child: Icon(
          Icons.message,
        ),
      ),
      body: Column(
        children: [
          Material(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            elevation: 8,
            child: Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Colors.amberAccent,
              ),
              padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Obrolan',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Get.toNamed(Routes.PROFILE);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.person,
                            size: 35,
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: myChat.length,
            itemBuilder: (context, index) {
              return myChat[index];
            },
          ))
        ],
      ),
    );
  }
}
