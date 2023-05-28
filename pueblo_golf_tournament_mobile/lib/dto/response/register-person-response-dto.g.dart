// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-person-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPersonResponseDto _$RegisterPersonResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterPersonResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : PersonDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterPersonResponseDtoToJson(
        RegisterPersonResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
