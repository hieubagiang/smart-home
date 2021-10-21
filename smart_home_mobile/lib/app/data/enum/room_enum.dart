import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RoomTypeEnum {
  static RoomType? getRoomType(int? id) {
    if (id == null) {
      return null;
    }
    return RoomType.values.where((value) => value.id == id).first;
  }
}

enum RoomType { LIVING_ROOM, BED_ROOM, KITCHEN, BATH_ROOM, YARD }

extension RoomTypeExtension on RoomType {
  int get id {
    switch (this) {
      case RoomType.LIVING_ROOM:
        return 1;
      case RoomType.BED_ROOM:
        return 2;
      case RoomType.KITCHEN:
        return 3;
      case RoomType.BATH_ROOM:
        return 4;
      case RoomType.YARD:
        return 5;
      default:
        return -1;
    }
  }

  String get label {
    switch (this) {
      case RoomType.LIVING_ROOM:
        return 'living_room'.tr;
      case RoomType.BED_ROOM:
        return 'bed_room'.tr;
      case RoomType.KITCHEN:
        return 'kitchen'.tr;
      case RoomType.BATH_ROOM:
        return 'bath_room'.tr;
      case RoomType.YARD:
        return 'yard'.tr;
      default:
        return '';
    }
  }
}
