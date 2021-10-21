import 'dart:convert';

import 'package:smart_home/app/common/helper/mqtt_helper.dart';
import 'package:smart_home/app/common/utils/functions.dart';
import 'package:smart_home/app/data/models/message_model.dart';
import 'package:smart_home/app/domain/entities/message_entity.dart';

class Device {
  String? id;
  String? title;
  String? subtitle;
  dynamic icon;
  int status;
  String? topic;
  bool isAuto;
  int? digitalIo;

  Device(
      {this.title,
      this.subtitle,
      this.icon,
      this.status = 0,
      this.id,
      this.isAuto = true,
      this.digitalIo,
      required this.topic});

  void controlDevice(bool value) {
    this.status = value == true ? 1 : 0;
  }

  MessageModel getPushMessage() {
    return MessageModel.parseEntity(MessageEntity(
        digitalIo: this.digitalIo, status: this.status, isAuto: this.isAuto));
  }

  void setStatus(MessageEntity messageEntity) {
    this.isAuto = messageEntity.isAuto ?? this.isAuto;
    this.status = messageEntity.status ?? this.status;
  }

  void pushDeviceStatus() {
    if (this.topic != null && this.topic!.isNotEmpty) {
      FunctionUtils.logWhenDebug(this, 'this.topic====> true =$this');
      MQTTHelper().publishToTopic(
          this.topic!, '${jsonEncode(getPushMessage().toJson())}');
    } else {
      FunctionUtils.logWhenDebug(this, 'this.topic false =$this');
    }
  }

  bool get isEnable => this.status == 1;

  @override
  String toString() {
    return 'Device{id: $id, title: $title, subtitle: $subtitle, leftIcon: $icon, status: $status, topic: $topic, isAuto: $isAuto}';
  }
}
