import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

part 'tournament-team-division-dto.g.dart';

@JsonSerializable()
class TournamentTeamDivisionDto extends BaseDto {
  final int divisionId;
  final int teamId;
  final int tournamentId;
  TournamentTeamDivisionDto({
    required super.id,
    required this.divisionId,
    required this.teamId,
    required this.tournamentId,
  });

  factory TournamentTeamDivisionDto.fromJson(Map<String, dynamic> json) =>
      _$TournamentTeamDivisionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentTeamDivisionDtoToJson(this);
}
