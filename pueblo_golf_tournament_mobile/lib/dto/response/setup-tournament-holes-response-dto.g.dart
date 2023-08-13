// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup-tournament-holes-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupTournamentHolesResponseDto _$SetupTournamentHolesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    SetupTournamentHolesResponseDto(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => TournamentHoleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SetupTournamentHolesResponseDtoToJson(
        SetupTournamentHolesResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
