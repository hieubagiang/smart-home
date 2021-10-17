import 'package:smart_home/app/data/models/message_model.dart';

class MessageEntity {
  MessageEntity({
    this.digitalIo,
    this.status,
    this.isAuto,
    this.data,
  });

  int? digitalIo;
  int? status;
  bool? isAuto;
  List<double>? data;

  MessageEntity copyWith({
    int? digitalIo,
    int? status,
    bool? isAuto,
    List<double>? data,
  }) =>
      MessageEntity(
        digitalIo: digitalIo ?? this.digitalIo,
        status: status ?? this.status,
        isAuto: isAuto ?? this.isAuto,
        data: data ?? this.data,
      );

  factory MessageEntity.parseModel(MessageModel model) {
    return MessageEntity(
      digitalIo: model.digitalIo,
      status: model.status,
      isAuto: model.isAuto,
      data: model.data,
    );
  }

  MessageModel toModel() {
    return MessageModel.parseEntity(this);
  }
}
