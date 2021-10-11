import 'package:smart_home/app/data/models/room_model/room_model.dart';
import 'package:smart_home/app/domain/entities/Device.dart';

class RoomEntity {
  int? id;
  String? name;
  String? roomType;
  List<Device>? devices;

  RoomEntity({this.id, this.name, this.roomType, this.devices});

  factory RoomEntity.parseModel(RoomModel model) {
    return RoomEntity(
        id: model.id ?? null,
        name: model.name ?? null,
        roomType: model.roomType ?? null,
        devices: model.devices ?? null);
  }

  RoomModel toModel() {
    return RoomModel.parseEntity(this);
  }

  void changeDeviceStatus(String topic, String message) {
    this.devices?.forEach((element) {
      if (element.topic == topic) {
        element.setStatus(message);
      }
    });
  }

  @override
  String toString() {
    return 'RoomEntity{id: $id, name: $name, roomType: $roomType}';
  }
}
