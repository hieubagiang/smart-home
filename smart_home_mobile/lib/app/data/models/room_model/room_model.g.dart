// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return RoomModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    roomType: json['room_type'] as String?,
  );
}

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'room_type': instance.roomType,
    };
