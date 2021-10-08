import 'package:json_annotation/json_annotation.dart';

part 'edit_room_request.g.dart';

@JsonSerializable()
class EditRoomRequest {
  @JsonKey(name: 'name')
  final String name;

  EditRoomRequest({
    required this.name,
  });

  factory EditRoomRequest.fromJson(Map<String, dynamic> json) =>
      _$EditRoomRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditRoomRequestToJson(this);

  @override
  String toString() {
    return 'EditRoomRequest{name: $name}';
  }
}
