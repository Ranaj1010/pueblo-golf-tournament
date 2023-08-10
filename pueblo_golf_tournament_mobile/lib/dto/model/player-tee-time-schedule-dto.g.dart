// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player-tee-time-schedule-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerTeeTimeScheduleDto _$PlayerTeeTimeScheduleDtoFromJson(
        Map<String, dynamic> json) =>
    PlayerTeeTimeScheduleDto(
      id: json['id'] as int,
      playerId: json['playerId'] as int,
      teeTimeScheduleId: json['teeTimeScheduleId'] as int,
      holeType: json['holeType'] as int,
    );

Map<String, dynamic> _$PlayerTeeTimeScheduleDtoToJson(
        PlayerTeeTimeScheduleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playerId': instance.playerId,
      'teeTimeScheduleId': instance.teeTimeScheduleId,
      'holeType': instance.holeType,
    };
