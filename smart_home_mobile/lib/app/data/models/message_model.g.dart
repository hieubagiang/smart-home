// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return MessageModel(
    status: json['status'] as int?,
    digitalIo: json['digitalIo'] as int?,
    isAuto: json['isAuto'] as bool?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => (e as num).toDouble())
        .toList(),
    tag: json['tag'] as String?,
  );
}

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'digitalIo': instance.digitalIo,
      'isAuto': instance.isAuto,
      'data': instance.data,
      'tag': instance.tag,
    };
