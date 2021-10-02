import 'package:flutter/material.dart';
import 'package:smart_home_mobile/app/domain/entities/appliance.dart';

class ConnectedModel {
  List<Device> _applianceList = [
    /*Device(
        title: 'A/C',
        subtitle: '24 C',
        leftIcon: Icons.ac_unit,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),
    Device(
        title: 'Music',
        subtitle: 'Turned off',
        leftIcon: Icons.queue_music,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: false),
    Device(
        title: 'Router',
        subtitle: 'Sweet Home',
        leftIcon: Icons.router,
        topRightIcon: Icons.router,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),*/
    Device(
        title: 'Light',
        leftIcon: Icons.lightbulb_outline,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: true,
        isAuto: true,
        topic: 'smarthome/led'),
/*    Device(
        title: '',
        subtitle: '70 % brightness',
        leftIcon: Icons.threesixty,
        topRightIcon: Icons.threesixty,
        bottomRightIcon: Icons.threesixty,
        isEnable: true),*/
  ];
}

class ApplianceListModel extends ConnectedModel {
  List<Device> get allYatch {
    return List.from(_applianceList);
  }

  void changeDeviceStatus(String topic, String message) {
    allYatch.forEach((element) {
      if (element.topic == topic) {
        element.setStatus(int.parse(message));
      }
    });
  }
}
