// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-tournament-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTournamentRequestDto _$UpdateTournamentRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateTournamentRequestDto(
      person: TournamentDto.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateTournamentRequestDtoToJson(
        UpdateTournamentRequestDto instance) =>
    <String, dynamic>{
      'person': instance.person,
    };
