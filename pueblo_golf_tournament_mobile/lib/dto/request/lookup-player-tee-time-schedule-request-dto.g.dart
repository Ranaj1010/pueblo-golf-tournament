// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-player-tee-time-schedule-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupPlayerTeeTimeScheduleRequest _$LookupPlayerTeeTimeScheduleRequestFromJson(
        Map<String, dynamic> json) =>
    LookupPlayerTeeTimeScheduleRequest(
      tournamentId: json['tournamentId'] as int,
      playerId: json['playerId'] as int,
    );

Map<String, dynamic> _$LookupPlayerTeeTimeScheduleRequestToJson(
        LookupPlayerTeeTimeScheduleRequest instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'playerId': instance.playerId,
    };
