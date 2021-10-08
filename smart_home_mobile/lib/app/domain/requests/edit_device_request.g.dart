// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditDeviceRequest _$EditDeviceRequestFromJson(Map<String, dynamic> json) {
  return EditDeviceRequest(
    name: json['name'] as String?,
    status: json['status'] as int?,
    digitalIo: json['digitalIo'] as int?,
    deviceType: json['deviceType'] as int?,
    startTime: json['startTime'] as String?,
    endTime: json['endTime'] as String?,
  );
}

Map<String, dynamic> _$EditDeviceRequestToJson(EditDeviceRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'digitalIo': instance.digitalIo,
      'deviceType': instance.deviceType,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
