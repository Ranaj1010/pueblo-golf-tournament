// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-player-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePlayerRequestDto _$UpdatePlayerRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdatePlayerRequestDto(
      player: PlayerDto.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdatePlayerRequestDtoToJson(
        UpdatePlayerRequestDto instance) =>
    <String, dynamic>{
      'player': instance.player,
    };
