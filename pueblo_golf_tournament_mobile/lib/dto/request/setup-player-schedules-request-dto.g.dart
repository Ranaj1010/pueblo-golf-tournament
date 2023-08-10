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
          .map((e) =>
              TeeTimeSchedulesRequestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tournamentId: json['tournamentId'] as int,
    );

Map<String, dynamic> _$SetupPlayerSchedulesRequestDtoToJson(
        SetupPlayerSchedulesRequestDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'playerId': instance.playerId,
      'teeTimeSchedules': instance.teeTimeSchedules,
    };

TeeTimeSchedulesRequestDto _$TeeTimeSchedulesRequestDtoFromJson(
        Map<String, dynamic> json) =>
    TeeTimeSchedulesRequestDto(
      holeType: json['holeType'] as int,
      teeTimeSchedule: TeeTimeScheduleDto.fromJson(
          json['teeTimeSchedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeeTimeSchedulesRequestDtoToJson(
        TeeTimeSchedulesRequestDto instance) =>
    <String, dynamic>{
      'holeType': instance.holeType,
      'teeTimeSchedule': instance.teeTimeSchedule,
    };
