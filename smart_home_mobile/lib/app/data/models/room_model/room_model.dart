import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home/app/domain/entities/Device.dart';
import 'package:smart_home/app/domain/entities/room_entity/room_entity.dart';

part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'room_type')
  final String? roomType;
  @JsonKey(ignore: true)
  final List<Device>? devices;

  RoomModel({this.id, this.name, this.roomType, this.devices});

  factory RoomModel.parseEntity(RoomEntity entity) {
    return RoomModel(id: entity.id,name: entity.name,roomType:entity.roomType, devices: entity.devices);
  }

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
