// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-tournament-team-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupTournamentTeamRequestDto _$LookupTournamentTeamRequestDtoFromJson(
        Map<String, dynamic> json) =>
    LookupTournamentTeamRequestDto(
      tournamentId: json['tournamentId'] as int,
      teamCaptainId: json['teamCaptainId'] as int,
    );

Map<String, dynamic> _$LookupTournamentTeamRequestDtoToJson(
        LookupTournamentTeamRequestDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'teamCaptainId': instance.teamCaptainId,
    };
