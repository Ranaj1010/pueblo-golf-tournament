// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup-player-schedules-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupPlayerSchedulesRequestDto _$SetupPlayerSchedulesRequestDtoFromJson(
        Map<String, dynamic> json) =>
    SetupPlayerSchedulesRequestDto(
      playerId: json['playerId'] as int,
      teeTimeSchedules: (json['teeTimeSchedules'] as List<dynamic>)
          .map((e) => TeeTimeScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SetupPlayerSchedulesRequestDtoToJson(
        SetupPlayerSchedulesRequestDto instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'teeTimeSchedules': instance.teeTimeSchedules,
    };
