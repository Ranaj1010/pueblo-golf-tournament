// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-team-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTeamRequestDto _$RegisterTeamRequestDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterTeamRequestDto(
      tournamentId: json['tournamentId'] as int,
      teamCaptainId: json['teamCaptainId'] as int,
      name: json['name'] as String,
      backgroundColor: json['backgroundColor'] as String,
      payment: RegisterPaymentRequestDto.fromJson(
          json['payment'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$RegisterTeamRequestDtoToJson(
        RegisterTeamRequestDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'teamCaptainId': instance.teamCaptainId,
      'name': instance.name,
      'backgroundColor': instance.backgroundColor,
      'payment': instance.payment,
      'members': instance.members,
    };
