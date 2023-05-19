// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate-login-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateLoginDto _$AuthenticateLoginDtoFromJson(
        Map<String, dynamic> json) =>
    AuthenticateLoginDto(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthenticateLoginDtoToJson(
        AuthenticateLoginDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
