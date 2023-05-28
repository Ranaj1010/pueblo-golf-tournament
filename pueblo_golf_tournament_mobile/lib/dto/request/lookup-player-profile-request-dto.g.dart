// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-player-profile-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupPlayeProfileRequestDto _$LookupPlayeProfileRequestDtoFromJson(
        Map<String, dynamic> json) =>
    LookupPlayeProfileRequestDto(
      playerExternalId: json['playerExternalId'] as String,
    );

Map<String, dynamic> _$LookupPlayeProfileRequestDtoToJson(
        LookupPlayeProfileRequestDto instance) =>
    <String, dynamic>{
      'playerExternalId': instance.playerExternalId,
    };

LookupPlayeProfileByPersonIdRequestDto
    _$LookupPlayeProfileByPersonIdRequestDtoFromJson(
            Map<String, dynamic> json) =>
        LookupPlayeProfileByPersonIdRequestDto(
          personId: json['personId'] as int,
        );

Map<String, dynamic> _$LookupPlayeProfileByPersonIdRequestDtoToJson(
        LookupPlayeProfileByPersonIdRequestDto instance) =>
    <String, dynamic>{
      'personId': instance.personId,
    };
