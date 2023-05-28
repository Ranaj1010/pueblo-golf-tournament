// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-team-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTeamResponseDto _$RegisterTeamResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterTeamResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : RegisterTeamDataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterTeamResponseDtoToJson(
        RegisterTeamResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

RegisterTeamDataDto _$RegisterTeamDataDtoFromJson(Map<String, dynamic> json) =>
    RegisterTeamDataDto(
      registration: RegistrationDto.fromJson(
          json['registration'] as Map<String, dynamic>),
      team: TeamDto.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterTeamDataDtoToJson(
        RegisterTeamDataDto instance) =>
    <String, dynamic>{
      'registration': instance.registration,
      'team': instance.team,
    };
