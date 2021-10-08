import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home_mobile/app/common/constants/icon_constants.dart';
import 'package:smart_home_mobile/app/domain/entities/Device.dart';

class MockData {
  static List<Device> get devicesOfLivingRoom => <Device>[
        Device(
            title: 'Đèn',
            leftIcon: Icons.lightbulb_outline,
            isEnable: true,
            isAuto: true,
            topic: 'smarthome/led'),
        Device(
            title: 'Quạt',
            leftIcon: FontAwesomeIcons.fan,
            isEnable: true,
            isAuto: false,
            topic: ''),
      ];

  static List<Device> get devicesOfBedRoom => <Device>[
        Device(
            title: 'Đèn',
            leftIcon: Icons.lightbulb_outline,
            isEnable: true,
            isAuto: false,
            topic: ''),
        Device(
            title: 'Quạt',
            leftIcon: FontAwesomeIcons.fan,
            isEnable: false,
            isAuto: false,
            topic: ''),
      ];

  static List<Device> get devicesOfKitchen => <Device>[
        Device(
            title: 'Đèn',
            leftIcon: Icons.lightbulb_outline,
            isEnable: false,
            isAuto: true,
            topic: ''),
        Device(
            title: 'Quạt',
            leftIcon: FontAwesomeIcons.fan,
            isEnable: false,
            isAuto: false,
            topic: ''),
        Device(
            title: 'Hệ thống báo cháy',
            leftIcon: FontAwesomeIcons.bullhorn,
            isEnable: false,
            isAuto: true,
            topic: 'smarthome/flame'),
      ];

  static List<Device> get devicesOfBathRoom => <Device>[
        Device(
            title: 'Đèn',
            leftIcon: Icons.lightbulb_outline,
            isEnable: false,
            isAuto: true,
            topic: ''),
        Device(
            title: 'Nóng lạnh',
            leftIcon: IconConstants.waterHeaterIcon,
            isEnable: false,
            isAuto: false,
            topic: ''),
      ];

  static List<Device> get devicesOfYard => <Device>[
        Device(
            title: 'Đèn',
            leftIcon: Icons.lightbulb_outline,
            isEnable: false,
            isAuto: true,
            topic: ''),
        Device(
            title: 'Tưới cây',
            leftIcon: FontAwesomeIcons.seedling,
            isEnable: false,
            isAuto: true,
            topic: 'smarthome/watertree'),
        Device(
            title: 'Còi báo động',
            leftIcon: FontAwesomeIcons.bullhorn,
            isEnable: false,
            isAuto: true,
            topic: ''),
      ];
}
