// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save-tournament-player-score-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveTournamentPlayerScoreRequestDto
    _$SaveTournamentPlayerScoreRequestDtoFromJson(Map<String, dynamic> json) =>
        SaveTournamentPlayerScoreRequestDto(
          tournamentId: json['tournamentId'] as int,
          playerId: json['playerId'] as int,
          teamId: json['teamId'] as int,
          registrationId: json['registrationId'] as int,
          tournamentHoleId: json['tournamentHoleId'] as int,
          teeTimeScheduleId: json['teeTimeScheduleId'] as int,
          actualStrokes: json['actualStrokes'] as int,
          scorerId: json['scorerId'] as int,
        );

Map<String, dynamic> _$SaveTournamentPlayerScoreRequestDtoToJson(
        SaveTournamentPlayerScoreRequestDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'playerId': instance.playerId,
      'teamId': instance.teamId,
      'registrationId': instance.registrationId,
      'tournamentHoleId': instance.tournamentHoleId,
      'teeTimeScheduleId': instance.teeTimeScheduleId,
      'actualStrokes': instance.actualStrokes,
      'scorerId': instance.scorerId,
    };
