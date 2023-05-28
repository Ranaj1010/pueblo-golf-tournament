// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerDto _$PlayerDtoFromJson(Map<String, dynamic> json) => PlayerDto(
      id: json['id'] as int,
      playerType: json['playerType'] as int,
      worldHandicapSystemId: json['worldHandicapSystemId'] as String,
      playerExternalId: json['playerExternalId'] as String,
      handicap: (json['handicap'] as num).toDouble(),
      homeClub: json['homeClub'] as String,
      personId: json['personId'] as int,
      person: json['person'] == null
          ? null
          : PersonDto.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerDtoToJson(PlayerDto instance) => <String, dynamic>{
      'id': instance.id,
      'playerType': instance.playerType,
      'worldHandicapSystemId': instance.worldHandicapSystemId,
      'playerExternalId': instance.playerExternalId,
      'handicap': instance.handicap,
      'homeClub': instance.homeClub,
      'personId': instance.personId,
      'person': instance.person,
    };
