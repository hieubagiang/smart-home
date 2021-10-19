import 'package:smart_home/app/common/utils/functions.dart';
import 'package:smart_home/app/data/enum/statics_enum.dart';
enum NotificationType { STATICS, NORMAL, ALERT }

class NotificationTypeEnum {
  static NotificationType? getNotificationType(String inputValue) {
    return NotificationType.values.where((value) => value.label == inputValue).first;
  }

  static NotificationType? getNotificationTypeFrom(String value) {}


  static NotificationType getNotificationTypeFromMessage(
      StaticsType staticsType, double value) {
    if (staticsType == StaticsType.TEMPERATURE) {
      if (value >= 25 && value <= 28) {
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
    } else if (staticsType == StaticsType.HUMIDITY) {
      if (value < 65 || value > 85) {
        return NotificationType.ALERT;
      }
    }
    return NotificationType.NORMAL;
  }
}


extension NotificationTypeExtension on NotificationType {
  double get id {
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


  String getMessage(StaticsType staticsType, String value) {
    switch (this) {
      case NotificationType.STATICS:
        return '${staticsType.label} hiện tại là $value độ';
      case NotificationType.NORMAL:
        return 'NORMAL';
        case NotificationType.ALERT:
        return '${staticsType.label} vượt ngưỡng an toàn: $value độ';
      default:
        return '';
    }
  }
  String? get soundPath {
    switch (this) {
      case NotificationType.NORMAL:
        return 'normal';
      case NotificationType.ALERT:
        return 'red_alert';
      case NotificationType.STATICS:
        return '';
    }
  }


}
