import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home/app/domain/entities/device_entity/device_entity.dart';

part 'device_model.g.dart';

@JsonSerializable()
class DeviceModel {
  DeviceModel({
    this.id,
    this.name,
    this.status,
    this.digitalIo,
    this.deviceType,
    this.startTime,
    this.endTime,
  });

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'digitalIo')
  final int? digitalIo;
  @JsonKey(name: 'deviceType')
  final int? deviceType;
  @JsonKey(name: 'startTime')
  final String? startTime;
  @JsonKey(name: 'endTime')
  final String? endTime;

  factory DeviceModel.parseEntity(DeviceEntity entity) {
    return DeviceModel(id: entity.id, name: entity.name);
  }

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);
}
