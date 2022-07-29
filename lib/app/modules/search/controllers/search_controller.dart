import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  late TextEditingController search;

  var query = [].obs;
  var temp = [].obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void searchUser(String data, String email) async {
    if (data.length == 0) {
      query.value = [];
      temp.value = [];
    } else {
      var capitalize = data.substring(0, 1).toUpperCase() + data.substring(1);
      print(capitalize);
      if (query.length == 0 && data.length == 1) {
        CollectionReference user = await firebaseFirestore.collection('user');
        final keyResult = await user
            .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
            .where("email", isNotEqualTo: email)
            .get();
        print('Total ${keyResult.docs.length}');
        if (keyResult.docs.length > 0) {
          for (int i = 0; i < keyResult.docs.length; i++) {
            query.add(keyResult.docs[i].data() as Map<String, dynamic>);
          }
          print("query result ${query}");
        } else {
          print('Query NULLLLL');
        }
      }
      if (query.length != 0) {
        temp.value = [];
        query.forEach((element) {
          if (element["name"].startsWith(capitalize)) {
            temp.add(element);
          }
        });
      }
    }
    query.refresh();
    temp.refresh();
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }
}
