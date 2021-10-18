import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:smart_home/app/common/base/base_controller.dart';
import 'package:smart_home/app/common/constants/colors_constant.dart';
import 'package:smart_home/app/common/helper/local_notification_helper.dart';
import 'package:smart_home/app/common/helper/push_notificaction_helper/model/message.dart';
import 'package:smart_home/app/common/helper/push_notificaction_helper/push_notification_helper.dart';
import 'package:smart_home/app/common/utils/functions.dart';
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
    PushNotificationHelper().onMessage = onMessageFirebaseCallBack;
  }

  void onMessageFirebaseCallBack(RemoteMessage message){
    final _payLoad = getNotificationContent(message);
    FunctionUtils.logWhenDebug(this, 'onMessage: $_payLoad');
    if (message.notification != null) {
      final title = message.notification?.title ?? '';
      final body =  message.notification?.body ?? '';
      LocalNotificationHelper().showNotification(
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '');
      if(message.notification?.android?.tag=='temp_alert'){
        FunctionUtils.showSnackBar(title, body,colorText: ColorUtils.whiteColor,
            backgroundColor: ColorUtils.redNotiColor);
      }
    }
  }
}
