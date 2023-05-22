// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-tournament-team-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupTournamentTeamResponseDto _$LookupTournamentTeamResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupTournamentTeamResponseDto(
      tournamentId: json['tournamentId'] as int,
      registration: json['registration'] == null
          ? null
          : RegistrationDto.fromJson(
              json['registration'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : TeamDto.fromJson(json['team'] as Map<String, dynamic>),
      division: json['division'] == null
          ? null
          : DivisionDto.fromJson(json['division'] as Map<String, dynamic>),
      tournament: json['tournament'] == null
          ? null
          : TournamentDto.fromJson(json['tournament'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LookupTournamentTeamResponseDtoToJson(
        LookupTournamentTeamResponseDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'tournament': instance.tournament,
      'registration': instance.registration,
      'team': instance.team,
      'division': instance.division,
    };
