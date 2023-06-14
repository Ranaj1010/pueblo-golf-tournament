// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-tournament-player-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTournamentPlayerResponseDto
    _$RegisterTournamentPlayerResponseDtoFromJson(Map<String, dynamic> json) =>
        RegisterTournamentPlayerResponseDto(
          message: json['message'] as String,
          playerProfile: json['playerProfile'] == null
              ? null
              : TournamentPlayerDto.fromJson(
                  json['playerProfile'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RegisterTournamentPlayerResponseDtoToJson(
        RegisterTournamentPlayerResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'playerProfile': instance.playerProfile,
    };
