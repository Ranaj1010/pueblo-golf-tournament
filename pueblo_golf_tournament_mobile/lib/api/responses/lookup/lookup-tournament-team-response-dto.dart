import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/division-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/registration-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/tournament-dto.dart';

part 'lookup-tournament-team-response-dto.g.dart';

@JsonSerializable()
class LookupTournamentTeamResponseDto {
  final int tournamentId;
  final TournamentDto? tournament;
  final RegistrationDto? registration;
  final TeamDto? team;
  final DivisionDto? division;

  LookupTournamentTeamResponseDto(
      {required this.tournamentId,
      required this.registration,
      required this.team,
      required this.division,
      required this.tournament});

  factory LookupTournamentTeamResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupTournamentTeamResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LookupTournamentTeamResponseDtoToJson(this);
}
