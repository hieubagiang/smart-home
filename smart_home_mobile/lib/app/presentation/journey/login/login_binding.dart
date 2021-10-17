import 'package:get/get.dart';
import 'package:smart_home/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:smart_home/app/domain/usecases/authentication_use_case_impl.dart';

import 'controller/login_logic.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => LoginUseCaseImpl(Get.find<AuthenticationRepositoryImpl>()));
    Get.lazyPut(() => LoginController());
  }
}
