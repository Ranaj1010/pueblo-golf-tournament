// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication-login-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationLoginDto _$AuthenticationLoginDtoFromJson(
        Map<String, dynamic> json) =>
    AuthenticationLoginDto(
      message: json['message'] as String,
      authenticated: json['authenticated'] as bool,
      data: json['data'] == null
          ? null
          : AuthenticatedUserData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthenticationLoginDtoToJson(
        AuthenticationLoginDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'authenticated': instance.authenticated,
      'data': instance.data,
    };

AuthenticatedUserData _$AuthenticatedUserDataFromJson(
        Map<String, dynamic> json) =>
    AuthenticatedUserData(
      personalDetails: json['personalDetails'] == null
          ? null
          : Person.fromJson(json['personalDetails'] as Map<String, dynamic>),
      playerDetails: json['playerDetails'] == null
          ? null
          : PlayerDto.fromJson(json['playerDetails'] as Map<String, dynamic>),
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$AuthenticatedUserDataToJson(
        AuthenticatedUserData instance) =>
    <String, dynamic>{
      'personalDetails': instance.personalDetails,
      'playerDetails': instance.playerDetails,
      'userName': instance.userName,
    };
