// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) {
  return DeviceModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    status: json['status'] as int?,
    digitalIo: json['digitalIo'] as int?,
    deviceType: json['deviceType'] as int?,
    startTime: json['startTime'] as String?,
    endTime: json['endTime'] as String?,
  );
}

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'digitalIo': instance.digitalIo,
      'deviceType': instance.deviceType,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
