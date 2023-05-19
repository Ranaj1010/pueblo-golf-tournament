// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered-team-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteredTeamDto _$RegisteredTeamDtoFromJson(Map<String, dynamic> json) =>
    RegisteredTeamDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : RegisteredTeamDataDto.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisteredTeamDtoToJson(RegisteredTeamDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

RegisteredTeamDataDto _$RegisteredTeamDataDtoFromJson(
        Map<String, dynamic> json) =>
    RegisteredTeamDataDto(
      registration: RegistrationDto.fromJson(
          json['registration'] as Map<String, dynamic>),
      team: TeamDto.fromJson(json['team'] as Map<String, dynamic>),
      teamCaptain:
          PlayerDto.fromJson(json['teamCaptain'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>)
          .map((e) => PlayerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegisteredTeamDataDtoToJson(
        RegisteredTeamDataDto instance) =>
    <String, dynamic>{
      'registration': instance.registration,
      'team': instance.team,
      'teamCaptain': instance.teamCaptain,
      'members': instance.members,
    };
