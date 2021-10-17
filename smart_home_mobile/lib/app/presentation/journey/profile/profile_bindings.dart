import 'package:get/get.dart';
import 'package:smart_home/app/presentation/journey/profile/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
