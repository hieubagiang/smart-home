import 'package:get/get.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/home_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
