// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament-player-score-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentPlayerScoreDto _$TournamentPlayerScoreDtoFromJson(
        Map<String, dynamic> json) =>
    TournamentPlayerScoreDto(
      id: json['id'] as int,
      tournamentId: json['tournamentId'] as int,
      playerId: json['playerId'] as int,
      teamId: json['teamId'] as int,
      registrationId: json['registrationId'] as int,
      tournamentHoleId: json['tournamentHoleId'] as int,
      playerTeeTimeScheduleId: json['playerTeeTimeScheduleId'] as int,
      teeTimeScheduleId: json['teeTimeScheduleId'] as int,
      actualStrokes: json['actualStrokes'] as int,
      molaveScore: json['molaveScore'] as int,
      scorerId: json['scorerId'] as int,
    );

Map<String, dynamic> _$TournamentPlayerScoreDtoToJson(
        TournamentPlayerScoreDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournamentId': instance.tournamentId,
      'playerId': instance.playerId,
      'teamId': instance.teamId,
      'registrationId': instance.registrationId,
      'tournamentHoleId': instance.tournamentHoleId,
      'playerTeeTimeScheduleId': instance.playerTeeTimeScheduleId,
      'teeTimeScheduleId': instance.teeTimeScheduleId,
      'actualStrokes': instance.actualStrokes,
      'molaveScore': instance.molaveScore,
      'scorerId': instance.scorerId,
    };
