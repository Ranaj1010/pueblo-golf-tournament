import 'package:json_annotation/json_annotation.dart';

part 'lookup-tournament-team-request-dto.g.dart';

@JsonSerializable()
class LookupTournamentTeamRequestDto {
  final int tournamentId;
  final int teamCaptainId;

  LookupTournamentTeamRequestDto(
      {required this.tournamentId, required this.teamCaptainId});

  factory LookupTournamentTeamRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LookupTournamentTeamRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LookupTournamentTeamRequestDtoToJson(this);
}
