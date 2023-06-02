// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-team-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTeamResponseDto _$UpdateTeamResponseDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateTeamResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : TeamDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateTeamResponseDtoToJson(
        UpdateTeamResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
