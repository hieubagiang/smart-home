import 'package:get/get.dart';
import 'package:smart_home/app/data/repositories_impl/room_repository_impl.dart';
import 'package:smart_home/app/data/repositories_impl/user_repository_impl.dart';
import 'package:smart_home/app/presentation/journey/room_management/use_case/impl/room_management_use_case_impl.dart';

import 'room_logic.dart';

class RoomManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomManagementUseCaseImpl(
        Get.find<UserRepositoryImpl>(), Get.find<RoomRepositoryImpl>()));
    Get.lazyPut(() => RoomManagementController());
  }
}
