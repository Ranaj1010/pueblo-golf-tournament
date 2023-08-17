// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save-tournament-player-score-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveTournamentPlayerScoreResponseDto
    _$SaveTournamentPlayerScoreResponseDtoFromJson(Map<String, dynamic> json) =>
        SaveTournamentPlayerScoreResponseDto(
          message: json['message'] as String,
          data: json['data'] == null
              ? null
              : TournamentPlayerScoreDto.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SaveTournamentPlayerScoreResponseDtoToJson(
        SaveTournamentPlayerScoreResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
