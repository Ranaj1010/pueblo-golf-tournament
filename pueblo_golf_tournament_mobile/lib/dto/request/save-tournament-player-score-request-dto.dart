import 'package:json_annotation/json_annotation.dart';

part 'save-tournament-player-score-request-dto.g.dart';

@JsonSerializable()
class SaveTournamentPlayerScoreRequestDto {
  final int tournamentId;
  final int playerId;
  final int teamId;
  final int registrationId;
  final int tournamentHoleId;
  final int teeTimeScheduleId;
  final int actualStrokes;
  final int scorerId;

  SaveTournamentPlayerScoreRequestDto(
      {required this.tournamentId,
      required this.playerId,
      required this.teamId,
      required this.registrationId,
      required this.tournamentHoleId,
      required this.teeTimeScheduleId,
      required this.actualStrokes,
      required this.scorerId});

  factory SaveTournamentPlayerScoreRequestDto.fromJson(
          Map<String, dynamic> json) =>
      _$SaveTournamentPlayerScoreRequestDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SaveTournamentPlayerScoreRequestDtoToJson(this);
}
