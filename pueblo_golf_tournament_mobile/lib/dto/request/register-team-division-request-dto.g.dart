// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-team-division-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTeamDivisionRequestDto _$RegisterTeamDivisionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterTeamDivisionRequestDto(
      tournamentId: json['tournamentId'] as int,
      teamId: json['teamId'] as int,
      divisionId: json['divisionId'] as int,
    );

Map<String, dynamic> _$RegisterTeamDivisionRequestDtoToJson(
        RegisterTeamDivisionRequestDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'teamId': instance.teamId,
      'divisionId': instance.divisionId,
    };
