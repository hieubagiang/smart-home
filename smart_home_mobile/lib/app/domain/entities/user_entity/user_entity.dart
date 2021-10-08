import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home_mobile/app/data/models/user_model/user_model.dart';

class UserEntity {
  int id;
  String name;

  UserEntity({required this.id, required this.name});

  factory UserEntity.parseModel(UserModel model) {
    return UserEntity(id: model.id, name: model.name);
  }

  UserModel toModel() {
    return UserModel.parseEntity(this);
  }
}
