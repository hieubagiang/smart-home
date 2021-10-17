import 'package:smart_home/app/common/base/base_controller.dart';

class MainController extends BaseController {
  var selectedIndex = 0.obs;
  RxBool isProtector = false.obs;
  void handleIndexChanged(int index) {
    selectedIndex.value = index;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
