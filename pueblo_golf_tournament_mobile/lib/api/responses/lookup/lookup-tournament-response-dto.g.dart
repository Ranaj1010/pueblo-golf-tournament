// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-tournament-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupTournamentResponseDto _$LookupTournamentResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupTournamentResponseDto(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => TournamentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LookupTournamentResponseDtoToJson(
        LookupTournamentResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
