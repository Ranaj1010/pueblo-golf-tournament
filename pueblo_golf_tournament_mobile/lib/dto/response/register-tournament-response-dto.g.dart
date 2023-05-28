// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-tournament-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTournamentResponseDto _$RegisterTournamentResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterTournamentResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : TournamentDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterTournamentResponseDtoToJson(
        RegisterTournamentResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
