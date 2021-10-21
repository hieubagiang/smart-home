import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home/app/domain/entities/user_entity/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  UserModel({required this.id, required this.name});

  factory UserModel.parseEntity(UserEntity entity) {
    return UserModel(id: entity.id, name: entity.name);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
