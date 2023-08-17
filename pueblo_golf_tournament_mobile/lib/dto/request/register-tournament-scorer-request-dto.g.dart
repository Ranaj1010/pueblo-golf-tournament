// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-tournament-scorer-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqisterTournamentScorerRequestDto _$ReqisterTournamentScorerRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ReqisterTournamentScorerRequestDto(
      tournamentId: json['tournamentId'] as int,
      scorerId: json['scorerId'] as int,
    );

Map<String, dynamic> _$ReqisterTournamentScorerRequestDtoToJson(
        ReqisterTournamentScorerRequestDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'scorerId': instance.scorerId,
    };
