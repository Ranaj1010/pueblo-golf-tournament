// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament-player-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentPlayerDto _$TournamentPlayerDtoFromJson(Map<String, dynamic> json) =>
    TournamentPlayerDto(
      registrationId: json['registrationId'] as int,
      tournamentId: json['tournamentId'] as int,
      divisionId: json['divisionId'] as int,
      playerId: json['playerId'] as int,
    );

Map<String, dynamic> _$TournamentPlayerDtoToJson(
        TournamentPlayerDto instance) =>
    <String, dynamic>{
      'registrationId': instance.registrationId,
      'tournamentId': instance.tournamentId,
      'divisionId': instance.divisionId,
      'playerId': instance.playerId,
    };
