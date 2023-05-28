// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-division-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDivisionRequestDto _$RegisterDivisionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterDivisionRequestDto(
      name: json['name'] as String,
      tournamentId: json['tournamentId'] as int,
    );

Map<String, dynamic> _$RegisterDivisionRequestDtoToJson(
        RegisterDivisionRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tournamentId': instance.tournamentId,
    };
