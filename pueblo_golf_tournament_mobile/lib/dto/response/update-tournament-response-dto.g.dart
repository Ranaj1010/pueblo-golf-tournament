// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-tournament-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTournamentResponseDto _$UpdateTournamentResponseDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateTournamentResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : TournamentDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateTournamentResponseDtoToJson(
        UpdateTournamentResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
