import 'package:smart_home/app/common/base/base_controller.dart';
import 'package:smart_home/app/common/helper/push_notificaction_helper/model/message.dart';
import 'package:smart_home/app/presentation/journey/main/main_use_case.dart';

class MainController extends BaseController {
  final MainUseCase mainUseCase;
  var selectedIndex = 0.obs;
  RxBool isProtector = false.obs;

  MainController(this.mainUseCase);
  void handleIndexChanged(int index) {
    selectedIndex.value = index;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

}
