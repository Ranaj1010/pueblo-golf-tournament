// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-player-scores-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupPlayerScoresResponse _$LookupPlayerScoresResponseFromJson(
        Map<String, dynamic> json) =>
    LookupPlayerScoresResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              TournamentPlayerScoreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LookupPlayerScoresResponseToJson(
        LookupPlayerScoresResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
