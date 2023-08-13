// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-tournament-holes-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupTournamentHolesResponseDto _$LookupTournamentHolesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupTournamentHolesResponseDto(
      tournamentId: json['tournamentId'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => TournamentHoleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LookupTournamentHolesResponseDtoToJson(
        LookupTournamentHolesResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'tournamentId': instance.tournamentId,
      'data': instance.data,
    };
