import 'package:smart_home/app/data/models/device_model/device_model.dart';
import 'package:smart_home/app/domain/requests/edit_device_request.dart';

class DeviceEntity {
  DeviceEntity({
    this.id,
    this.name,
    this.status,
    this.digitalIo,
    this.deviceType,
    this.startTime,
    this.endTime,
  });

  final int? id;
  final String? name;
  final int? status;
  final int? digitalIo;
  final int? deviceType;
  final String? startTime;
  final String? endTime;

  DeviceEntity copyWith({
    int? id,
    String? name,
    int? status,
    int? digitalIo,
    int? deviceType,
    String? startTime,
    String? endTime,
  }) =>
      DeviceEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        digitalIo: digitalIo ?? this.digitalIo,
        deviceType: deviceType ?? this.deviceType,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  factory DeviceEntity.parseModel(DeviceModel model) {
    return DeviceEntity(id: model.id, name: model.name);
  }

  DeviceModel toModel() {
    return DeviceModel.parseEntity(this);
  }

  EditDeviceRequest toRequest() {
    return EditDeviceRequest.parseEntity(this);
  }
}
