// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-player-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPlayerRequestDto _$RegisterPlayerRequestDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterPlayerRequestDto(
      worldHandicapSystemId: json['worldHandicapSystemId'] as String,
      homeClub: json['homeClub'] as String,
      personId: json['personId'] as int,
    );

Map<String, dynamic> _$RegisterPlayerRequestDtoToJson(
        RegisterPlayerRequestDto instance) =>
    <String, dynamic>{
      'worldHandicapSystemId': instance.worldHandicapSystemId,
      'homeClub': instance.homeClub,
      'personId': instance.personId,
    };
