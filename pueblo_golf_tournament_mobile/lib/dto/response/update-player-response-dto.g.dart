// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-player-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePlayerResponseDto _$UpdatePlayerResponseDtoFromJson(
        Map<String, dynamic> json) =>
    UpdatePlayerResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : PlayerDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdatePlayerResponseDtoToJson(
        UpdatePlayerResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
