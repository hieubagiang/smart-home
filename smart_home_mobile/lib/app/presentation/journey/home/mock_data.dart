import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home/app/common/constants/icon_constants.dart';
import 'package:smart_home/app/domain/entities/Device.dart';

class MockData {
  static List<Device> get devicesOfLivingRoom => <Device>[
        Device(
            title: 'Đèn',
            icon: Icons.lightbulb_outline,
            status: 1,
            isAuto: true,
            topic: 'smarthome'),
        Device(
            title: 'Quạt',
            icon: FontAwesomeIcons.fan,
            status: 0,
            isAuto: true,
            digitalIo: 4,
            topic: 'smarthome'),
      ];

  static List<Device> get devicesOfBedRoom => <Device>[
        Device(
            title: 'Đèn',
            icon: Icons.lightbulb_outline,
            status: 1,
            isAuto: false,
            digitalIo: 2,
            topic: 'smarthome'),
        Device(
            title: 'Quạt',
            icon: FontAwesomeIcons.fan,
            status: 0,
            isAuto: false,
            topic: ''),
      ];

  static List<Device> get devicesOfKitchen => <Device>[
        Device(
            title: 'Đèn',
            icon: Icons.lightbulb_outline,
            status: 0,
            isAuto: true,
            topic: ''),
        Device(
            title: 'Quạt',
            icon: FontAwesomeIcons.fan,
            status: 0,
            isAuto: false,
            topic: ''),
        Device(
            title: 'Còi báo động',
            icon: FontAwesomeIcons.bullhorn,
            status: 0,
            isAuto: true,
            digitalIo: 3,
            topic: 'smarthome'),
      ];

  static List<Device> get devicesOfBathRoom => <Device>[
        Device(
            title: 'Đèn',
            icon: Icons.lightbulb_outline,
            status: 0,
            isAuto: true,
            topic: ''),
        Device(
            title: 'Nóng lạnh',
            icon: IconConstants.waterHeaterIcon,
            status: 0,
            isAuto: false,
            topic: ''),
      ];

  static List<Device> get devicesOfYard => <Device>[
        Device(
            title: 'Đèn',
            icon: Icons.lightbulb_outline,
            status: 0,
            isAuto: true,
            topic: ''),
        Device(
            title: 'Tưới cây',
            icon: FontAwesomeIcons.seedling,
            status: 0,
            isAuto: true,
            digitalIo: 1,
            topic: 'smarthome'),
        Device(
            title: 'Còi báo động',
            icon: FontAwesomeIcons.bullhorn,
            status: 0,
            isAuto: true,
            topic: ''),
      ];
}
