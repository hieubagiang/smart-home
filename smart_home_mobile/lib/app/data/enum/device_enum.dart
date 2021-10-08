import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DeviceTypeEnum {
  static DeviceType? getDeviceType(int? id) {
    if (id == null) {
      return null;
    }
    return DeviceType.values.where((value) => value.id == id).first;
  }
}

enum DeviceType { LED, TEMPERATURE_SENSOR, RAIN_SENSOR, GAS_SENSOR, PUMP }

extension DeviceTypeExtension on DeviceType {
  int get id {
    switch (this) {
      case DeviceType.LED:
        return 1;
      case DeviceType.TEMPERATURE_SENSOR:
        return 2;
      case DeviceType.RAIN_SENSOR:
        return 3;
      case DeviceType.GAS_SENSOR:
        return 4;
      case DeviceType.PUMP:
        return 5;
      default:
        return -1;
    }
  }
  String get label {
    switch (this) {
      case DeviceType.LED:
        return 'LED'.tr;
      case DeviceType.TEMPERATURE_SENSOR:
        return 'TEMPERATURE_SENSOR'.tr;
      case DeviceType.RAIN_SENSOR:
        return 'RAIN_SENSOR'.tr;
      case DeviceType.GAS_SENSOR:
        return 'GAS_SENSOR'.tr;
      case DeviceType.PUMP:
        return 'PUMP'.tr;
      default:
        return '';
    }
  }
}
