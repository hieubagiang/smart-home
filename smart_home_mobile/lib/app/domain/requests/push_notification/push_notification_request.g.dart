// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationRequest _$PushNotificationRequestFromJson(
    Map<String, dynamic> json) {
  return PushNotificationRequest(
    priority: json['priority'] as String?,
    data: json['data'] == null
        ? null
        : PushNotificationDataRequest.fromJson(
            json['data'] as Map<String, dynamic>),
    notification: json['notification'] == null
        ? null
        : NotificationRequest.fromJson(
            json['notification'] as Map<String, dynamic>),
    to: json['to'] as String?,
  );
}

Map<String, dynamic> _$PushNotificationRequestToJson(
        PushNotificationRequest instance) =>
    <String, dynamic>{
      'priority': instance.priority,
      'data': instance.data,
      'notification': instance.notification,
      'to': instance.to,
    };
