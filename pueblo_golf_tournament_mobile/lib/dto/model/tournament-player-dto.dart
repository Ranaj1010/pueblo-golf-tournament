import 'package:json_annotation/json_annotation.dart';

part 'tournament-player-dto.g.dart';

@JsonSerializable()
class TournamentPlayerDto {
  final int registrationId;
  final int tournamentId;
  final int divisionId;
  final int playerId;

  TournamentPlayerDto(
      {required this.registrationId,
      required this.tournamentId,
      required this.divisionId,
      required this.playerId});
  factory TournamentPlayerDto.fromJson(Map<String, dynamic> json) =>
      _$TournamentPlayerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentPlayerDtoToJson(this);
}
