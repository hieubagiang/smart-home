import 'package:smart_home/app/data/enum/statics_enum.dart';
import 'package:smart_home/app/domain/requests/push_notification/notification_request.dart';
import 'package:smart_home/app/domain/requests/push_notification/push_notification_data_request.dart';
import 'package:smart_home/app/domain/requests/push_notification/push_notification_request.dart';

class NotificationTypeEnum {
  static NotificationType? getNotificationType(int? id) {
    if (id == null) {
      return null;
    }
    return NotificationType.values.where((value) => value.id == id).first;
  }

  static NotificationType? getNotificationTypeFromMessage(StaticsType staticsType,int value) {
    if (staticsType == StaticsType.TEMPERATURE) {
      if(value>= 25 && value <=28){
        return NotificationType.STATICS;
     /*   final title = 'Smart Home';
        final body = 'Nhiệt độ hiện tại là $value độ';
        final tag = '${NotificationType.STATICS.id}';
        PushNotificationRequest(
            priority: 'HIGH',
            data: PushNotificationDataRequest(
              title: 'Smart Home',
              body: 'Nhiệt độ hiện tại là $value độ',
              tag: '${NotificationType.STATICS.id}',
              priority: 0,
              clickAction: 'FLUTTER_NOTIFICATION_CLICK',
            ),
            notification: NotificationRequest(
              title: 'Smart Home',
              body: 'Nhiệt độ hiện tại là $value độ',
              tag: '${NotificationType.STATICS.id}',
            )
        );*/
      }
      return NotificationType.ALERT;
    }else if(staticsType == StaticsType.HUMIDITY){

    }

  }
}

enum NotificationType { STATICS, NORMAL, ALERT }

extension NotificationTypeExtension on NotificationType {
  int get id {
    switch (this) {
      case NotificationType.STATICS:
        return 1;
      case NotificationType.NORMAL:
        return 2;
      case NotificationType.ALERT:
        return 3;
      default:
        return -1;
    }
  }

  String get label {
    switch (this) {
      case NotificationType.STATICS:
        return 'STATICS';
      case NotificationType.NORMAL:
        return 'NORMAL';
        case NotificationType.ALERT:
        return 'ALERT';
      default:
        return '';
    }
  }
}
