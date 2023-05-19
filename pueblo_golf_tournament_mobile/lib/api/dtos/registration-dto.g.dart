// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationDto _$RegistrationDtoFromJson(Map<String, dynamic> json) =>
    RegistrationDto(
      json['teamId'] as int,
      json['teamCaptainId'] as int,
      json['tournamentId'] as int,
      json['divisionId'] as int,
      json['status'] as int,
      DateTime.parse(json['registrationDate'] as String),
      json['paymentId'] as int?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$RegistrationDtoToJson(RegistrationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teamId': instance.teamId,
      'teamCaptainId': instance.teamCaptainId,
      'tournamentId': instance.tournamentId,
      'divisionId': instance.divisionId,
      'status': instance.status,
      'registrationDate': instance.registrationDate.toIso8601String(),
      'paymentId': instance.paymentId,
    };
