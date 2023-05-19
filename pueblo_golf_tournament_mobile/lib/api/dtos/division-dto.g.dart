// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'division-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DivisionDto _$DivisionDtoFromJson(Map<String, dynamic> json) => DivisionDto(
      name: json['name'] as String,
      tournamentId: (json['tournamentId'] as num).toDouble(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$DivisionDtoToJson(DivisionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tournamentId': instance.tournamentId,
    };
