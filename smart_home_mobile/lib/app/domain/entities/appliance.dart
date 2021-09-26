import 'package:flutter/cupertino.dart';
import 'package:smart_home_mobile/app/common/helper/mqtt_helper.dart';

class Device {
  String? id;
  String? title;
  String? subtitle;
  IconData? leftIcon;
  IconData? topRightIcon;
  IconData? bottomRightIcon;
  bool isEnable;
  String topic;

  Device(
      {this.title,
      this.subtitle,
      this.leftIcon,
      this.topRightIcon,
      this.bottomRightIcon,
      this.isEnable = false,
      this.id,
      required this.topic});

  void changeDeviceStatus(bool isEnable) {
    this.isEnable = isEnable;
  }

  void pushDeviceStatus() {
    MQTTHelper().publishToTopic(this.topic, '${this.isEnable ? 1 : 0}');
  }
}
