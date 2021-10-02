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
  bool isAuto;

  Device(
      {this.title,
      this.subtitle,
      this.leftIcon,
      this.topRightIcon,
      this.bottomRightIcon,
      this.isEnable = false,
      this.id,
      this.isAuto = true,
      required this.topic});

  void controlDevice(bool isEnable) {
    this.isEnable = isEnable;
  }

  int getPushValue() {
    if (this.isAuto) {
      return isEnable ? 1 : 0;
    } else {
      return isEnable ? 3 : 2;
    }
  }

  void setStatus(int value) {
    if (value == 0) {
      isEnable = false;
      this.isAuto = true;
    } else if (value == 1) {
      isEnable = true;
      this.isAuto = true;
    } else if (value == 2) {
      isEnable = false;
      this.isAuto = false;
    } else if (value == 3) {
      isEnable = true;
      this.isAuto = false;
    }
  }

  void pushDeviceStatus() {
    MQTTHelper().publishToTopic(this.topic, '${getPushValue()}');
  }
}
