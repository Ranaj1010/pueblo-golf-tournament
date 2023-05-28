// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-player-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPlayerResponseDto _$RegisterPlayerResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterPlayerResponseDto(
      message: json['message'] as String,
      playerProfile: json['playerProfile'] == null
          ? null
          : PlayerProfile.fromJson(
              json['playerProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterPlayerResponseDtoToJson(
        RegisterPlayerResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'playerProfile': instance.playerProfile,
    };
