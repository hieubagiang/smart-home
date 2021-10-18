class StaticsTypeEnum {
  static StaticsType? getStaticsType(int? id) {
    if (id == null) {
      return null;
    }
    return StaticsType.values.where((value) => value.id == id).first;
  }

  static StaticsType? getStaticsTypeFromMessage(int? id) {
    if (id == null) {
      return null;
    }
    return StaticsType.values.where((value) => value.id == id).first;
  }
}

enum StaticsType { TEMPERATURE, HUMIDITY  }

extension StaticsTypeExtension on StaticsType {
  int get id {
    switch (this) {
      case StaticsType.TEMPERATURE:
        return 1;
      case StaticsType.HUMIDITY:
        return 2;
      default:
        return -1;
    }
  }

  String get label {
    switch (this) {
      case StaticsType.TEMPERATURE:
        return 'TEMPERATURE';
      case StaticsType.HUMIDITY:
        return 'HUMIDITY';
      default:
        return '';
    }
  }
}
