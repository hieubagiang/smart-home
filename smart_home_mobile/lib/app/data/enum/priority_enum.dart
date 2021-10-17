class PriorityTypeEnum {
  static PriorityType? getPriorityType(int? id) {
    if (id == null) {
      return null;
    }
    return PriorityType.values.where((value) => value.id == id).first;
  }
}

enum PriorityType { LOW, NORMAL, HIGH }

extension PriorityTypeExtension on PriorityType {
  int get id {
    switch (this) {
      case PriorityType.LOW:
        return 1;
      case PriorityType.NORMAL:
        return 2;
      case PriorityType.HIGH:
        return 3;
      default:
        return -1;
    }
  }
  String get label {
    switch (this) {
      case PriorityType.LOW:
        return 'LOW';
      case PriorityType.NORMAL:
        return 'NORMAL';
      case PriorityType.HIGH:
        return 'HIGH';
      default:
        return '';
    }
  }
}
