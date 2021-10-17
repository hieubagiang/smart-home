import 'package:smart_home/app/common/helper/push_notificaction_helper/model/message.dart';
import 'package:smart_home/app/domain/requests/push_notification/push_notification_request.dart';

abstract class MainUseCase{
  void sendPushNotification(PushNotificationRequest cloudMessageModel);
}