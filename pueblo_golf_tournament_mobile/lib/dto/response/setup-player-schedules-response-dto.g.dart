// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup-player-schedules-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupPlayerSchedulesResponseDto _$SetupPlayerSchedulesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    SetupPlayerSchedulesResponseDto(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              PlayerTeeTimeScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SetupPlayerSchedulesResponseDtoToJson(
        SetupPlayerSchedulesResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
