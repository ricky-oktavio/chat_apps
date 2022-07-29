import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_app/app/controllers/auth_controller.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final AuthC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('ProfileView'),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  AuthC.logout();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: AuthC.user.value.photoUrl == "noimage"
                            ? Image.asset("assets/logo/noimage.png",
                                fit: BoxFit.cover)
                            : Image.network(
                                AuthC.user.value.photoUrl!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Obx(() => Text(
                        "${AuthC.user.value.name!}",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  Text(
                    '${AuthC.user.value.email!}',
                    style: TextStyle(color: Colors.black54, fontSize: 22),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.UPDATE_STATUS);
                      },
                      leading: Icon(Icons.note_add_outlined),
                      title: Text('Update status ',
                          style: TextStyle(fontSize: 20)),
                      trailing: Icon(Icons.arrow_right_alt),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.UPDATE_PROFILE);
                      },
                      leading: Icon(Icons.person),
                      title:
                          Text('Ubah profil ', style: TextStyle(fontSize: 20)),
                      trailing: Icon(Icons.arrow_right_alt),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.change_circle),
                      title: Text('Ubah Tema ', style: TextStyle(fontSize: 20)),
                      trailing: Text('Light'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: context.mediaQueryPadding.bottom + 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Apps Chat',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Text(
                    'version 1.0.0',
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
