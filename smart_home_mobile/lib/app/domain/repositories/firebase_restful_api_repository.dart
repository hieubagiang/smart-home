import 'package:smart_home/app/domain/requests/push_notification/push_notification_request.dart';

abstract class PushNotificationRepository {
  Future<void> sendPushNotification(
      {required PushNotificationRequest cloudMessageModel});
}
