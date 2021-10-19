import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home/app/domain/entities/message_entity.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  MessageModel({
    this.status,
    this.digitalIo,
    this.isAuto,
    this.data,
    this.tag
  });

  @JsonKey(name: 'status')
  final int? status;
  @JsonKey(name: 'digitalIo')
  final int? digitalIo;
  @JsonKey(name: 'isAuto')
  final bool? isAuto;
  @JsonKey(name: 'data')
  final List<double>? data;
  @JsonKey(name: 'tag')
  final String? tag;

  factory MessageModel.parseEntity(MessageEntity entity) {
    return MessageModel(
      digitalIo: entity.digitalIo,
      status: entity.status,
      isAuto: entity.isAuto,
      data: entity.data,
      tag: entity.tag,
    );
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
