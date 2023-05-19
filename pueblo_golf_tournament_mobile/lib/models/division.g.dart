// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'division.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Division _$DivisionFromJson(Map<String, dynamic> json) => Division(
      name: json['name'] as String,
      tournamentId: (json['tournamentId'] as num).toDouble(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$DivisionToJson(Division instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tournamentId': instance.tournamentId,
    };
