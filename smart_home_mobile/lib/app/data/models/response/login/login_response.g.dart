// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    token: json['token'] as String?,
    displayName: json['display_name'] as String?,
  )..error = json['error'] == null
      ? null
      : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'token': instance.token,
      'display_name': instance.displayName,
    };
