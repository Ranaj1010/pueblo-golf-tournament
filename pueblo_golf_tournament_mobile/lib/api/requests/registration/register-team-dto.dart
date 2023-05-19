import 'package:pueblo_golf_tournament_mobile/api/dtos/payment-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/models/person.dart';

import 'package:json_annotation/json_annotation.dart';

import '../../dtos/person-dto.dart';

part 'register-team-dto.g.dart';

@JsonSerializable()
class RegisterTeamDto {
  final int tournamentId;
  final int divisionId;
  final TeamRawDto team;
  final PaymentDto payment;
  final TeamCaptainRawDto teamCaptain;
  final List<TeamMemberRawDto> members;

  factory RegisterTeamDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTeamDtoFromJson(json);

  RegisterTeamDto({
    required this.payment,
    required this.team,
    required this.teamCaptain,
    required this.members,
    required this.tournamentId,
    required this.divisionId,
  });

  Map<String, dynamic> toJson() => _$RegisterTeamDtoToJson(this);
}

@JsonSerializable()
class TeamRawDto {
  final String name;
  final String logoUrl;

  factory TeamRawDto.fromJson(Map<String, dynamic> json) =>
      _$TeamRawDtoFromJson(json);

  TeamRawDto({required this.name, required this.logoUrl});

  Map<String, dynamic> toJson() => _$TeamRawDtoToJson(this);
}

@JsonSerializable()
class TeamCaptainRawDto {
  final int personId;
  final PlayerDto playerDetails;

  factory TeamCaptainRawDto.fromJson(Map<String, dynamic> json) =>
      _$TeamCaptainRawDtoFromJson(json);

  TeamCaptainRawDto({required this.personId, required this.playerDetails});

  Map<String, dynamic> toJson() => _$TeamCaptainRawDtoToJson(this);
}

@JsonSerializable()
class TeamMemberRawDto {
  final PersonDto personalDetails;
  final PlayerDto playerDetails;

  factory TeamMemberRawDto.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberRawDtoFromJson(json);

  TeamMemberRawDto(
      {required this.personalDetails, required this.playerDetails});

  Map<String, dynamic> toJson() => _$TeamMemberRawDtoToJson(this);
}
