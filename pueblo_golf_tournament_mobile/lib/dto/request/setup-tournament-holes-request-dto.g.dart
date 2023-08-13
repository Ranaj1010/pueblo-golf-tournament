// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup-tournament-holes-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupTournamentHolesRequestDto _$SetupTournamentHolesRequestDtoFromJson(
        Map<String, dynamic> json) =>
    SetupTournamentHolesRequestDto(
      tournamentId: json['tournamentId'] as int,
      holes: (json['holes'] as List<dynamic>)
          .map((e) => HoleRequestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SetupTournamentHolesRequestDtoToJson(
        SetupTournamentHolesRequestDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'holes': instance.holes,
    };

HoleRequestDto _$HoleRequestDtoFromJson(Map<String, dynamic> json) =>
    HoleRequestDto(
      holeNumber: json['holeNumber'] as int,
      maximumStrokes: json['maximumStrokes'] as int,
    );

Map<String, dynamic> _$HoleRequestDtoToJson(HoleRequestDto instance) =>
    <String, dynamic>{
      'holeNumber': instance.holeNumber,
      'maximumStrokes': instance.maximumStrokes,
    };
