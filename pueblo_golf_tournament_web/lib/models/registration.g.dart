// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Registration _$RegistrationFromJson(Map<String, dynamic> json) => Registration(
      (json['teamId'] as num).toDouble(),
      (json['teamCaptainId'] as num).toDouble(),
      (json['tournamentId'] as num).toDouble(),
      (json['divisionId'] as num).toDouble(),
      json['status'] as int,
      DateTime.parse(json['registrationDate'] as String),
      (json['paymentId'] as num?)?.toDouble(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$RegistrationToJson(Registration instance) =>
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
