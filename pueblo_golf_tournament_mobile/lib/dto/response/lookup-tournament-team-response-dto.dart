import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/registration-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/division-dto.dart';

part 'lookup-tournament-team-response-dto.g.dart';

@JsonSerializable()
class LookupTournamentTeamResponseDto extends BaseResponse {
  final int tournamentId;
  final TournamentDto? tournament;
  final List<RegisteredTeam> registeredTeams;
  LookupTournamentTeamResponseDto({
    required super.message,
    required this.tournamentId,
    required this.tournament,
    required this.registeredTeams,
  });
  factory LookupTournamentTeamResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupTournamentTeamResponseDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LookupTournamentTeamResponseDtoToJson(this);
}

@JsonSerializable()
class RegisteredTeam {
  final RegistrationDto registration;
  final TeamDto team;
  final DivisionDto? division;
  final PlayerProfile captainProfile;
  final PaymentDto? payment;
  final List<PlayerProfile>? memberProfiles;
  RegisteredTeam({
    required this.registration,
    required this.captainProfile,
    required this.memberProfiles,
    required this.team,
    this.payment,
    this.division,
  });
  factory RegisteredTeam.fromJson(Map<String, dynamic> json) =>
      _$RegisteredTeamFromJson(json);
  Map<String, dynamic> toJson() => _$RegisteredTeamToJson(this);
}

@JsonSerializable()
class PlayerProfile {
  final PersonDto person;
  final PlayerDto player;

  factory PlayerProfile.fromJson(Map<String, dynamic> json) =>
      _$PlayerProfileFromJson(json);

  PlayerProfile({required this.person, required this.player});
  Map<String, dynamic> toJson() => _$PlayerProfileToJson(this);
}
