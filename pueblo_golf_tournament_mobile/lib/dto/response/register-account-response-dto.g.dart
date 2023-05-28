// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-account-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAccountResponseDto _$RegisterAccountResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterAccountResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : RegisteredAccountDataDto.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterAccountResponseDtoToJson(
        RegisterAccountResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

RegisteredAccountDataDto _$RegisteredAccountDataDtoFromJson(
        Map<String, dynamic> json) =>
    RegisteredAccountDataDto(
      person: PersonDto.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisteredAccountDataDtoToJson(
        RegisteredAccountDataDto instance) =>
    <String, dynamic>{
      'person': instance.person,
    };
