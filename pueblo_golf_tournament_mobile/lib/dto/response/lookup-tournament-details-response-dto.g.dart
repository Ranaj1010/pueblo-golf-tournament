// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-tournament-details-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupTournamentDetailsResponseDto _$LookupTournamentDetailsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupTournamentDetailsResponseDto(
      message: json['message'] as String,
      tournament: json['tournament'] == null
          ? null
          : TournamentDto.fromJson(json['tournament'] as Map<String, dynamic>),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => TeamDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      playetCount: json['playetCount'] as int,
      teamsCount: json['teamsCount'] as int,
    );

Map<String, dynamic> _$LookupTournamentDetailsResponseDtoToJson(
        LookupTournamentDetailsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'tournament': instance.tournament,
      'teams': instance.teams,
      'playetCount': instance.playetCount,
      'teamsCount': instance.teamsCount,
    };
