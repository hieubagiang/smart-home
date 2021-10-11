import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home/app/domain/entities/authentication/login_entity.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: 'accessToken')
  final String accessToken;

  LoginModel({required this.accessToken});


  factory LoginModel.parseEntity(LoginEntity entity) {
    return LoginModel(accessToken: entity.accessToken);
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  String toString() {
    return 'LoginModel{accessToken: $accessToken}';
  }
}
