// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-tournament-player-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTournamentPlayerRequestDto _$RegisterTournamentPlayerRequestDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterTournamentPlayerRequestDto(
      registrationId: json['registrationId'] as int,
      teamId: json['teamId'] as int,
      tournamentId: json['tournamentId'] as int,
      playerId: json['playerId'] as int,
    );

Map<String, dynamic> _$RegisterTournamentPlayerRequestDtoToJson(
        RegisterTournamentPlayerRequestDto instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'registrationId': instance.registrationId,
      'teamId': instance.teamId,
      'tournamentId': instance.tournamentId,
    };
