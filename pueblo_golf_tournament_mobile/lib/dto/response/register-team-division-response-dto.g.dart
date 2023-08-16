// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-team-division-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTeamDivisionResponseDto _$RegisterTeamDivisionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterTeamDivisionResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : TournamentTeamDivisionDto.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterTeamDivisionResponseDtoToJson(
        RegisterTeamDivisionResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
