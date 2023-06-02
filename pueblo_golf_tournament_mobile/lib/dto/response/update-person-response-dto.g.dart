// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-person-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePersonResponseDto _$UpdatePersonResponseDtoFromJson(
        Map<String, dynamic> json) =>
    UpdatePersonResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : PersonDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdatePersonResponseDtoToJson(
        UpdatePersonResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
