// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateRequestDto _$AuthenticateRequestDtoFromJson(
        Map<String, dynamic> json) =>
    AuthenticateRequestDto(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthenticateRequestDtoToJson(
        AuthenticateRequestDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
