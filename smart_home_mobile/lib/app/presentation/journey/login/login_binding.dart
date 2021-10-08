import 'package:get/get.dart';
import 'package:smart_home_mobile/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:smart_home_mobile/app/presentation/journey/login/use_case/impl/authentication_use_case_impl.dart';

import 'controller/login_logic.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => LoginUseCaseImpl(Get.find<AuthenticationRepositoryImpl>()));
    Get.lazyPut(() => LoginController());
  }
}
