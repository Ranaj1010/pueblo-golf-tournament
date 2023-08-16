// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-division-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupDivisionRequestDto _$LookupDivisionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    LookupDivisionRequestDto(
      filterName: json['filterName'] as String,
      tournamentId: json['tournamentId'] as int,
    );

Map<String, dynamic> _$LookupDivisionRequestDtoToJson(
        LookupDivisionRequestDto instance) =>
    <String, dynamic>{
      'filterName': instance.filterName,
      'tournamentId': instance.tournamentId,
    };
