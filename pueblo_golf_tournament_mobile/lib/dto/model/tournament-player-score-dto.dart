import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

part 'tournament-player-score-dto.g.dart';

@JsonSerializable()
class TournamentPlayerScoreDto extends BaseDto {
  final int tournamentId;
  final int playerId;
  final int teamId;
  final int registrationId;
  final int tournamentHoleId;
  final int playerTeeTimeScheduleId;
  final int teeTimeScheduleId;
  final int actualStrokes;
  final int molaveScore;
  final int scorerId;

  factory TournamentPlayerScoreDto.fromJson(Map<String, dynamic> json) =>
      _$TournamentPlayerScoreDtoFromJson(json);

  TournamentPlayerScoreDto(
      {required super.id,
      required this.tournamentId,
      required this.playerId,
      required this.teamId,
      required this.registrationId,
      required this.tournamentHoleId,
      required this.playerTeeTimeScheduleId,
      required this.teeTimeScheduleId,
      required this.actualStrokes,
      required this.molaveScore,
      required this.scorerId});

  Map<String, dynamic> toJson() => _$TournamentPlayerScoreDtoToJson(this);
}
