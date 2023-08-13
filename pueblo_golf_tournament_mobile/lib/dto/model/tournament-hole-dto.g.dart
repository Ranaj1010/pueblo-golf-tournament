// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament-hole-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentHoleDto _$TournamentHoleDtoFromJson(Map<String, dynamic> json) =>
    TournamentHoleDto(
      tournamentId: json['tournamentId'] as int,
      holeNumber: json['holeNumber'] as int,
      maximumStrokes: json['maximumStrokes'] as int,
    );

Map<String, dynamic> _$TournamentHoleDtoToJson(TournamentHoleDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'holeNumber': instance.holeNumber,
      'maximumStrokes': instance.maximumStrokes,
    };
