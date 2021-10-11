import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:smart_home/app/common/helper/mqtt_helper.dart';
import 'package:smart_home/app/common/utils/functions.dart';

class Device {
  String? id;
  String? title;
  String? subtitle;
  dynamic icon;
  bool isEnable;
  String? topic;
  bool isAuto;

  Device({this.title,
    this.subtitle,
    this.icon,
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

  void setStatus(dynamic value) {
    if (value is String) {
      value = num.tryParse(value);
    }
    if(value!=null) {
      log('${this.title} will set status = $value \n ${toString()}');
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
      log('changed value \n= ${toString()}');
    }
  }

  void pushDeviceStatus() {
    if(this.topic!=null && this.topic!.isNotEmpty){
      FunctionUtils.logWhenDebug(this, 'this.topic====> true =$this');
      MQTTHelper().publishToTopic(this.topic!, '${getPushValue()}');
    }else{
      FunctionUtils.logWhenDebug(this, 'this.topic false =$this');
    }
  }

  @override
  String toString() {
    return 'Device{id: $id, title: $title, subtitle: $subtitle, leftIcon: $icon, isEnable: $isEnable, topic: $topic, isAuto: $isAuto}';
  }
}
