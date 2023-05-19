// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-team-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTeamDto _$RegisterTeamDtoFromJson(Map<String, dynamic> json) =>
    RegisterTeamDto(
      payment: PaymentDto.fromJson(json['payment'] as Map<String, dynamic>),
      team: TeamRawDto.fromJson(json['team'] as Map<String, dynamic>),
      teamCaptain: TeamCaptainRawDto.fromJson(
          json['teamCaptain'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>)
          .map((e) => TeamMemberRawDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tournamentId: json['tournamentId'] as int,
      divisionId: json['divisionId'] as int,
    );

Map<String, dynamic> _$RegisterTeamDtoToJson(RegisterTeamDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'divisionId': instance.divisionId,
      'team': instance.team,
      'payment': instance.payment,
      'teamCaptain': instance.teamCaptain,
      'members': instance.members,
    };

TeamRawDto _$TeamRawDtoFromJson(Map<String, dynamic> json) => TeamRawDto(
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String,
    );

Map<String, dynamic> _$TeamRawDtoToJson(TeamRawDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logoUrl': instance.logoUrl,
    };

TeamCaptainRawDto _$TeamCaptainRawDtoFromJson(Map<String, dynamic> json) =>
    TeamCaptainRawDto(
      personId: json['personId'] as int,
      playerDetails:
          PlayerDto.fromJson(json['playerDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamCaptainRawDtoToJson(TeamCaptainRawDto instance) =>
    <String, dynamic>{
      'personId': instance.personId,
      'playerDetails': instance.playerDetails,
    };

TeamMemberRawDto _$TeamMemberRawDtoFromJson(Map<String, dynamic> json) =>
    TeamMemberRawDto(
      personalDetails:
          PersonDto.fromJson(json['personalDetails'] as Map<String, dynamic>),
      playerDetails:
          PlayerDto.fromJson(json['playerDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamMemberRawDtoToJson(TeamMemberRawDto instance) =>
    <String, dynamic>{
      'personalDetails': instance.personalDetails,
      'playerDetails': instance.playerDetails,
    };
