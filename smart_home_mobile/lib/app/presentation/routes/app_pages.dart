import 'package:get/get.dart';
import 'package:smart_home/app/presentation/journey/home/home_bindings.dart';
import 'package:smart_home/app/presentation/journey/home/home_page.dart';
import 'package:smart_home/app/presentation/journey/login/login_binding.dart';
import 'package:smart_home/app/presentation/journey/login/login_view.dart';
import 'package:smart_home/app/presentation/journey/main/controller/main_binding.dart';
import 'package:smart_home/app/presentation/journey/main/main_screen.dart';
import 'package:smart_home/app/presentation/journey/room_management/room_binding.dart';
import 'package:smart_home/app/presentation/journey/room_management/room_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: RouteList.MAIN, page: () => MainScreen(), binding: MainBinding()),
    GetPage(
      name: RouteList.HOME,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: RouteList.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteList.ROOM_MANAGEMENT,
      page: () => RoomManagementPage(),
      binding: RoomManagementBinding(),
    ),
  ];
}
