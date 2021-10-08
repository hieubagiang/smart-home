import 'package:get/get.dart';
import 'package:smart_home_mobile/app/common/network/http/dio_config.dart';
import 'package:smart_home_mobile/app/data/datasources/remote/room_api.dart';
import 'package:smart_home_mobile/app/data/datasources/remote/user_api.dart';
import 'package:smart_home_mobile/app/data/repositories_impl/room_repository_impl.dart';
import 'package:smart_home_mobile/app/data/repositories_impl/user_repository_impl.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/home_controller.dart';
import 'package:smart_home_mobile/app/presentation/journey/home_module/use_case/impl/home_use_case_impl.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserApi(dio));
    Get.lazyPut(() => RoomApi(dio));
    Get.lazyPut(() => UserRepositoryImpl(Get.find<UserApi>()));
    Get.lazyPut(() => RoomRepositoryImpl(Get.find<RoomApi>()));
    Get.lazyPut(() => HomeUseCaseImpl(
        Get.find<UserRepositoryImpl>(), Get.find<RoomRepositoryImpl>()));
    Get.lazyPut(() => HomeController());
  }
}
