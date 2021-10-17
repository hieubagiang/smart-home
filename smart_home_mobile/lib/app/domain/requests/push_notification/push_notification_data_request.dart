
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'push_notification_data_request.g.dart';
@JsonSerializable()
class PushNotificationDataRequest {
  PushNotificationDataRequest({
    this.title,
    this.body,
    this.priority,
    this.clickAction,
    this.tag,
  });

  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'body')
  final String? body;
  @JsonKey(name: 'priority')
  final int? priority;
  @JsonKey(name: 'click_action')
  final String? clickAction;
  @JsonKey(name: 'tag')
  final String? tag;

  PushNotificationDataRequest copyWith({
    String? title,
    String? body,
    int? priority,
    String? clickAction,
    String? tag,
  }) =>
      PushNotificationDataRequest(
        title: title ?? this.title,
        body: body ?? this.body,
        priority: priority ?? this.priority,
        clickAction: clickAction ?? this.clickAction,
        tag: tag ?? this.tag,
      );

  factory PushNotificationDataRequest.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PushNotificationDataRequestToJson(this);

  @override
  String toString() {
    return 'PushNotificationDataRequest{title: $title, body: $body, priority: $priority, clickAction: $clickAction, tag: $tag}';
  }
}
