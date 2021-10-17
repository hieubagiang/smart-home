import 'package:smart_home/app/common/helper/push_notificaction_helper/model/message.dart';
import 'package:smart_home/app/domain/repositories/firebase_restful_api_repository.dart';
import 'package:smart_home/app/domain/requests/push_notification/push_notification_request.dart';
import 'package:smart_home/app/presentation/journey/main/main_use_case.dart';

class MainUseCaseImpl extends MainUseCase {
  final PushNotificationRepository pushNotificationRepository;

  MainUseCaseImpl({required this.pushNotificationRepository});

  @override
  Future<void> sendPushNotification(PushNotificationRequest cloudMessageModel) async {
    await pushNotificationRepository.sendPushNotification(
        cloudMessageModel: cloudMessageModel);
    print('sended ${cloudMessageModel.toJson()}');
  }
}
