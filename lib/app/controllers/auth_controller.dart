import 'package:chat_app/app/data/models/users.model.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;

  var user = UsersModels().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> firstInitializer() async {
    await AutoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });
    await skipIntro().then((value) {
      if (value) {
        isSkipIntro.value = true;
      }
    });
  }

  Future<bool> skipIntro() async {
    final boxKey = GetStorage();
    if (boxKey.read('skipIntro') != null || boxKey.read('skipIntro') == true) {
      return true;
    }
    ;
    return false;
  }

  Future<bool> AutoLogin() async {
    try {
      final isSignOK = await _googleSignIn.isSignedIn();
      if (isSignOK) {
        await _googleSignIn
            .signInSilently()
            .then((value) => _currentUser = value);
        final googleAuth = await _currentUser!.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        ///
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);
        print(userCredential);

        ///
        CollectionReference users = firestore.collection('user');
        await users.doc(_currentUser!.email).update({
          'lastSignInTime':
              userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });
        final currentUser = await users.doc(_currentUser!.email).get();
        final currrentUserData = currentUser.data() as Map<String, dynamic>;
        user(UsersModels.fromJson(currrentUserData));
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> login() async {
    try {
      //handle data bocor
      await _googleSignIn.signOut();

      //untuk mendapatkan user
      await _googleSignIn.signIn().then((value) => _currentUser = value);
      final isSign = await _googleSignIn.isSignedIn();

      //cek status login
      if (isSign) {
        print('Login Succes');
        final googleAuth = await _currentUser!.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);
        print(userCredential);

        //simpan status
        final box = GetStorage();
        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);

        //up data ke firebase
        CollectionReference users = firestore.collection('user');
        final checkUserData = await users.doc(_currentUser!.email).get();

        if (checkUserData.data() == null) {
          await users.doc(_currentUser!.email).set({
            'uid': userCredential!.user!.uid,
            'name': _currentUser!.displayName,
            'keyName': _currentUser!.displayName!.substring(0, 1).toUpperCase(),
            'email': _currentUser!.email,
            'photoUrl': _currentUser!.photoUrl ?? "noimage",
            'status': '',
            'creationTime':
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            'lastSignInTime': userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            'updatedTime': DateTime.now().toIso8601String(),
            'chats': []
          });
        } else {
          await users.doc(_currentUser!.email).update({
            'lastSignInTime': userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }
        final currentUser = await users.doc(_currentUser!.email).get();
        final currrentUserData = currentUser.data() as Map<String, dynamic>;

        user(UsersModels.fromJson(currrentUserData));
        isAuth.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        print('Login Failed');
      }
      ;
      print(_currentUser);
    } catch (error) {
      print(error);
    }
  }

  void changeProfile(String name, String status) {
    String date = DateTime.now().toIso8601String();
    CollectionReference users = firestore.collection("user");
    users.doc(_currentUser!.email).update({
      "name": name,
      "keyName": name.substring(0, 1).toUpperCase(),
      "status": status,
      'creationTime':
          userCredential!.user!.metadata.creationTime!.toIso8601String(),
      'updatedTime': date
    });

    user.update((user) {
      user!.name = name;
      user.keyName = name.substring(0, 1).toUpperCase();
      user.status = status;
      user.creationTime =
          userCredential!.user!.metadata.creationTime!.toIso8601String();
      user.updatedTime = date;
    });
    user.refresh();
    Get.defaultDialog(title: 'Berhasil update', middleText: 'Data diperbarui');
  }

  void updateStatus(String status) {
    String date = DateTime.now().toIso8601String();
    CollectionReference users = firestore.collection("user");
    users.doc(_currentUser!.email).update({
      "status": status,
      'creationTime':
          userCredential!.user!.metadata.creationTime!.toIso8601String(),
      'updatedTime': date
    });

    user.update((user) {
      user!.status = status;
      user.creationTime =
          userCredential!.user!.metadata.creationTime!.toIso8601String();
      user.updatedTime = date;
    });
    user.refresh();
    Get.defaultDialog(
        title: 'Berhasil update', middleText: 'Status diperbarui');
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.DAFTAR);
  }

  ///seacrh
  void addNewConnection(String emailTo) async {
    bool flagNewConnection = false;
    var chat_id;
    String date = DateTime.now().toIso8601String();
    CollectionReference chat = firestore.collection('chat');
    CollectionReference users = firestore.collection('user');

    final docUser = await users.doc(_currentUser!.email).get();
    final docChat = (docUser.data() as Map<String, dynamic>)['chat'] as List;

    if (docChat.length != 0) {
      ///user has been chat

      docChat.forEach((singleChat) {
        if (singleChat["connection"] == emailTo) {
          chat_id = singleChat["chat_id"];
        }
      });

      if (chat_id != null) {
        flagNewConnection = false;
      } else {
        flagNewConnection = true;
      }
    } else {
      ///never chat
      flagNewConnection = true;
    }
    if (flagNewConnection) {
      final newChatData = await chat.add({
        "connections": [_currentUser!.email, emailTo],
        "totalChats": 0,
        "totalRead": 0,
        "totalUnread": 0,
        "chat": [],
        "lastTime": date
      });

      await users.doc(_currentUser!.email).update({
        "chats": [
          {"connection": emailTo, "chat_id": newChatData.id, "lastTime": date}
        ]
      });

      user.update((user) {
        user!.chats = [
          ChatUser(chatId: newChatData.id, connection: emailTo, lastTime: date)
        ];
      });
      chat_id = newChatData.id;
      user.refresh();
    }
    print(chat_id);
    Get.toNamed(Routes.CHATROOM, arguments: chat_id);
  }
}
