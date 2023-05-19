// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerDto _$PlayerDtoFromJson(Map<String, dynamic> json) => PlayerDto(
      id: json['id'] as int,
      playerType: json['playerType'] as int,
      worldHandicapSystemId: json['worldHandicapSystemId'] as String,
      handicap: (json['handicap'] as num).toDouble(),
      divisionId: (json['divisionId'] as num?)?.toDouble(),
      homeClub: json['homeClub'] as String?,
      teamId: (json['teamId'] as num?)?.toDouble(),
      personId: (json['personId'] as num?)?.toDouble(),
      person: json['person'] == null
          ? null
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      division: json['division'] == null
          ? null
          : Division.fromJson(json['division'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerDtoToJson(PlayerDto instance) => <String, dynamic>{
      'id': instance.id,
      'playerType': instance.playerType,
      'worldHandicapSystemId': instance.worldHandicapSystemId,
      'handicap': instance.handicap,
      'divisionId': instance.divisionId,
      'homeClub': instance.homeClub,
      'teamId': instance.teamId,
      'personId': instance.personId,
      'person': instance.person,
      'division': instance.division,
      'team': instance.team,
    };
