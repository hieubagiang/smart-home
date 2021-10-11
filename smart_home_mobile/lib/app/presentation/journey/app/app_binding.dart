import 'package:get/get.dart';
import 'package:smart_home/app/common/network/http/dio_config.dart';
import 'package:smart_home/app/data/datasources/remote/authentication_api.dart';
import 'package:smart_home/app/data/repositories_impl/authentication_repository_impl.dart';

import 'app_logic.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationApi(dio), fenix: true);
    Get.lazyPut(
        () => AuthenticationRepositoryImpl(Get.find<AuthenticationApi>()),
        fenix: true);
    Get.lazyPut(() => AppController(), fenix: true);
  }
}
