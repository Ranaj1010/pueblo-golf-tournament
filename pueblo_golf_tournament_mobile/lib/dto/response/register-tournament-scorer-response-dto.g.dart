// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-tournament-scorer-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqisterTournamentScorerResponseDto
    _$ReqisterTournamentScorerResponseDtoFromJson(Map<String, dynamic> json) =>
        ReqisterTournamentScorerResponseDto(
          message: json['message'] as String,
          success: json['success'] as bool,
        );

Map<String, dynamic> _$ReqisterTournamentScorerResponseDtoToJson(
        ReqisterTournamentScorerResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
