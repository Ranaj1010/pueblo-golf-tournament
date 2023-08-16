// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-team-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTeamRequestDto _$UpdateTeamRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateTeamRequestDto(
      team: TeamDto.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateTeamRequestDtoToJson(
        UpdateTeamRequestDto instance) =>
    <String, dynamic>{
      'team': instance.team,
    };
