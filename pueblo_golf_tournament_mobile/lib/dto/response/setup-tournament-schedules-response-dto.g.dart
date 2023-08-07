// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup-tournament-schedules-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupTournamentSchedulesResponseDto
    _$SetupTournamentSchedulesResponseDtoFromJson(Map<String, dynamic> json) =>
        SetupTournamentSchedulesResponseDto(
          message: json['message'] as String,
          success: json['success'] as bool,
        );

Map<String, dynamic> _$SetupTournamentSchedulesResponseDtoToJson(
        SetupTournamentSchedulesResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
