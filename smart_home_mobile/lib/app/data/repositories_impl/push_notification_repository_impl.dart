import 'dart:developer';

import 'package:smart_home/app/common/configs/configurations.dart';
import 'package:smart_home/app/common/helper/push_notificaction_helper/model/message.dart';
import 'package:smart_home/app/data/datasources/remote/push_notification_api.dart';
import 'package:smart_home/app/domain/repositories/firebase_restful_api_repository.dart';
import 'package:smart_home/app/domain/requests/push_notification/push_notification_request.dart';

class PushNotificationRepositoryImpl implements PushNotificationRepository {
  final PushNotificationApi pushNotificationApi;

  PushNotificationRepositoryImpl(this.pushNotificationApi);

  @override
  Future<void> sendPushNotification(
      {required PushNotificationRequest cloudMessageModel}) async {
    String authorization = Configurations.getFirebaseServerAuth(
        Configurations.firebaseServerToken);
    log('cloudMessageModel.toJson() = ${cloudMessageModel.toJson()}');
    final response = await pushNotificationApi.sendPushNotification(
        authorization, cloudMessageModel.toJson());
    return response;
  }
}
