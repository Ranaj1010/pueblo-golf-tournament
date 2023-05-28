// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateResponseDto _$AuthenticateResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AuthenticateResponseDto(
      message: json['message'] as String,
      authenticated: json['authenticated'] as bool,
      data: json['data'] == null
          ? null
          : AuthenticatedUserData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthenticateResponseDtoToJson(
        AuthenticateResponseDto instance) =>
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
          : PersonDto.fromJson(json['personalDetails'] as Map<String, dynamic>),
      account: json['account'] == null
          ? null
          : AccountDto.fromJson(json['account'] as Map<String, dynamic>),
      username: json['username'] as String,
    );

Map<String, dynamic> _$AuthenticatedUserDataToJson(
        AuthenticatedUserData instance) =>
    <String, dynamic>{
      'personalDetails': instance.personalDetails,
      'account': instance.account,
      'username': instance.username,
    };
