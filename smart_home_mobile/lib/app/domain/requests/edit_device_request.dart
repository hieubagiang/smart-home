import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home/app/domain/entities/device_entity/device_entity.dart';

part 'edit_device_request.g.dart';

@JsonSerializable()
class EditDeviceRequest {
  EditDeviceRequest({
    this.name,
    this.status,
    this.digitalIo,
    this.deviceType,
    this.startTime,
    this.endTime,
  });

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

  EditDeviceRequest copyWith({
    String? name,
    int? status,
    int? digitalIo,
    int? deviceType,
    String? startTime,
    String? endTime,
  }) =>
      EditDeviceRequest(
        name: name ?? this.name,
        status: status ?? this.status,
        digitalIo: digitalIo ?? this.digitalIo,
        deviceType: deviceType ?? this.deviceType,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  factory EditDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$EditDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditDeviceRequestToJson(this);

  factory EditDeviceRequest.parseEntity(DeviceEntity entity) {
    return EditDeviceRequest(
      name: entity.name,
      status: entity.status,
      digitalIo: entity.digitalIo,
      deviceType: entity.deviceType,
      startTime: entity.startTime,
      endTime: entity.endTime,
    );
  }

  @override
  String toString() {
    return 'EditDeviceRequest{name: $name}';
  }
}
