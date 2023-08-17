// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-player-scores-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupPlayerScoresRequest _$LookupPlayerScoresRequestFromJson(
        Map<String, dynamic> json) =>
    LookupPlayerScoresRequest(
      tournamentId: json['tournamentId'] as int,
      playerId: json['playerId'] as int,
      teamId: json['teamId'] as int,
      teeTimeScheduleId: json['teeTimeScheduleId'] as int,
    );

Map<String, dynamic> _$LookupPlayerScoresRequestToJson(
        LookupPlayerScoresRequest instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'playerId': instance.playerId,
      'teamId': instance.teamId,
      'teeTimeScheduleId': instance.teeTimeScheduleId,
    };
