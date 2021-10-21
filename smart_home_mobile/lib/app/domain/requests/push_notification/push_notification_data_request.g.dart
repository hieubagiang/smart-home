// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationDataRequest _$PushNotificationDataRequestFromJson(
    Map<String, dynamic> json) {
  return PushNotificationDataRequest(
    title: json['title'] as String?,
    body: json['body'] as String?,
    clickAction: json['click_action'] as String?,
    tag: json['tag'] as String?,
  );
}

Map<String, dynamic> _$PushNotificationDataRequestToJson(
        PushNotificationDataRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'click_action': instance.clickAction,
      'tag': instance.tag,
    };
