import 'package:get/get.dart';

import 'room_logic.dart';

class RoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomLogic());
  }
}
