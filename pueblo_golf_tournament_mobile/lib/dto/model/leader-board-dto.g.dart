// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader-board-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderBoardDto _$LeaderBoardDtoFromJson(Map<String, dynamic> json) =>
    LeaderBoardDto(
      tournamentId: json['tournamentId'] as int,
      score: json['score'] as int,
      team: TeamDto.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaderBoardDtoToJson(LeaderBoardDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'score': instance.score,
      'team': instance.team,
    };
