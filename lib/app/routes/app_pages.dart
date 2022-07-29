import 'package:get/get.dart';

import '../modules/chat_room/bindings/chat_room_binding.dart';
import '../modules/chat_room/views/chat_room_view.dart';
import '../modules/chatroom/bindings/chatroom_binding.dart';
import '../modules/chatroom/views/chatroom_view.dart';
import '../modules/daftar/bindings/daftar_binding.dart';
import '../modules/daftar/views/daftar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/update_profile/bindings/update_profile_binding.dart';
import '../modules/update_profile/views/update_profile_view.dart';
import '../modules/update_status/bindings/update_status_binding.dart';
import '../modules/update_status/views/update_status_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR,
      page: () => DaftarView(),
      binding: DaftarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHATROOM,
      page: () => ChatroomView(),
      binding: ChatroomBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_STATUS,
      page: () => UpdateStatusView(),
      binding: UpdateStatusBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => UpdateProfileView(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => ChatRoomView(),
      binding: ChatRoomBinding(),
    ),
  ];
}
