import 'package:get/get.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/home_bindings.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/home_page.dart';
part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
  ];
}
