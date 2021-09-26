import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home_mobile/app/data/models/base/base_data_response.dart';
import 'package:smart_home_mobile/app/data/models/base/error_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseDataResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "display_name")
  String? displayName;

  LoginResponse({this.token, this.displayName});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  String toString() {
    return 'LoginResponse{token: $token, displayName: $displayName}';
  }
}
