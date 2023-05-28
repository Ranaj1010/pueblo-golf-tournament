// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-division-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDivisionResponseDto _$RegisterDivisionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterDivisionResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DivisionDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterDivisionResponseDtoToJson(
        RegisterDivisionResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
