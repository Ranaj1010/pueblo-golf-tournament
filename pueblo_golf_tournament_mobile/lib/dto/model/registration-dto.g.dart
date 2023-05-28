// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationDto _$RegistrationDtoFromJson(Map<String, dynamic> json) =>
    RegistrationDto(
      id: json['id'] as int,
      teamId: json['teamId'] as int,
      teamCaptainId: json['teamCaptainId'] as int,
      tournamentId: json['tournamentId'] as int,
      status: json['status'] as int,
      registrationDate: DateTime.parse(json['registrationDate'] as String),
      isPayed: json['isPayed'] as bool,
      paymentId: json['paymentId'] as int,
    );

Map<String, dynamic> _$RegistrationDtoToJson(RegistrationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teamId': instance.teamId,
      'teamCaptainId': instance.teamCaptainId,
      'tournamentId': instance.tournamentId,
      'status': instance.status,
      'registrationDate': instance.registrationDate.toIso8601String(),
      'isPayed': instance.isPayed,
      'paymentId': instance.paymentId,
    };
