// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament-team-division-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentTeamDivisionDto _$TournamentTeamDivisionDtoFromJson(
        Map<String, dynamic> json) =>
    TournamentTeamDivisionDto(
      id: json['id'] as int,
      divisionId: json['divisionId'] as int,
      teamId: json['teamId'] as int,
      tournamentId: json['tournamentId'] as int,
    );

Map<String, dynamic> _$TournamentTeamDivisionDtoToJson(
        TournamentTeamDivisionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'divisionId': instance.divisionId,
      'teamId': instance.teamId,
      'tournamentId': instance.tournamentId,
    };
