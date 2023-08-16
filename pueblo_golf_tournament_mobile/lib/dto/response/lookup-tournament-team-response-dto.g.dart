// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-tournament-team-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupTournamentTeamResponseDto _$LookupTournamentTeamResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupTournamentTeamResponseDto(
      message: json['message'] as String,
      tournamentId: json['tournamentId'] as int,
      tournament: json['tournament'] == null
          ? null
          : TournamentDto.fromJson(json['tournament'] as Map<String, dynamic>),
      registeredTeams: (json['registeredTeams'] as List<dynamic>)
          .map((e) => RegisteredTeam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LookupTournamentTeamResponseDtoToJson(
        LookupTournamentTeamResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'tournamentId': instance.tournamentId,
      'tournament': instance.tournament,
      'registeredTeams': instance.registeredTeams,
    };

RegisteredTeam _$RegisteredTeamFromJson(Map<String, dynamic> json) =>
    RegisteredTeam(
      registration: RegistrationDto.fromJson(
          json['registration'] as Map<String, dynamic>),
      captainProfile: PlayerProfile.fromJson(
          json['captainProfile'] as Map<String, dynamic>),
      memberProfiles: (json['memberProfiles'] as List<dynamic>?)
          ?.map((e) => PlayerProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      team: TeamDto.fromJson(json['team'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : PaymentDto.fromJson(json['payment'] as Map<String, dynamic>),
      division: json['division'] == null
          ? null
          : DivisionDto.fromJson(json['division'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisteredTeamToJson(RegisteredTeam instance) =>
    <String, dynamic>{
      'registration': instance.registration,
      'team': instance.team,
      'division': instance.division,
      'captainProfile': instance.captainProfile,
      'payment': instance.payment,
      'memberProfiles': instance.memberProfiles,
    };

PlayerProfile _$PlayerProfileFromJson(Map<String, dynamic> json) =>
    PlayerProfile(
      person: PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      player: PlayerDto.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerProfileToJson(PlayerProfile instance) =>
    <String, dynamic>{
      'person': instance.person,
      'player': instance.player,
    };
