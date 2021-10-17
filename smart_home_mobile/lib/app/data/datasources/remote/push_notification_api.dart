import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_home/app/common/configs/configurations.dart';
import 'package:smart_home/app/common/utils/urls.dart';

part 'push_notification_api.g.dart';

@RestApi(baseUrl: Configurations.firebaseRestApi)
abstract class PushNotificationApi {
  factory PushNotificationApi(Dio dio) = _PushNotificationApi;

  @POST('${UrlConstants.pushNotificationUrl}')
  Future<void> sendPushNotification(
    @Header(Configurations.authentication) String authorization,
    @Body() Map<String, dynamic> map,
  );
}
