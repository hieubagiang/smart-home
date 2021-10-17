import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home/app/domain/requests/push_notification/notification_request.dart';
import 'package:smart_home/app/domain/requests/push_notification/push_notification_data_request.dart';

part 'push_notification_request.g.dart';
@JsonSerializable()
class PushNotificationRequest {
  PushNotificationRequest({
    this.priority,
    this.data,
    this.notification,
    this.to,
  });

  @JsonKey(name: 'priority')
  final String? priority;
  @JsonKey(name: 'data')
  final PushNotificationDataRequest? data;
  @JsonKey(name: 'notification')
  final NotificationRequest? notification;
  @JsonKey(name: 'to')
  final String? to;

  PushNotificationRequest copyWith({
    String? priority,
    PushNotificationDataRequest? data,
    NotificationRequest? notification,
    String? to,
  }) =>
      PushNotificationRequest(
        priority: priority ?? this.priority,
        data: data ?? this.data,
        notification: notification ?? this.notification,
        to: to ?? this.to,
      );

  factory PushNotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PushNotificationRequestToJson(this);

}

